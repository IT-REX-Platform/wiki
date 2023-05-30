# coding=utf-8
import argparse
import os
from gherkin.token_scanner import TokenScanner
from gherkin.token_matcher import TokenMatcher
from gherkin.parser import Parser
from gherkin.errors import ParserError
from sys import argv
import os

def fix_indentation(text):
    lines = text.split("\n")
    result = []
    min_indentation = None
    for line in lines:
        stripped_line = line.strip()
        if stripped_line == "":
            continue
        indentation = line.find(stripped_line)
        if min_indentation == None or indentation < min_indentation:
            min_indentation = indentation
    if min_indentation:
        for line in lines:
            stripped_line = line.strip()
            if stripped_line == "":
                result.append(line)
            else:
                result.append(line[min_indentation:])
    return "\n".join(result)

def write_section(output, title, level):
    output.write("#"*level + " " + title + "\n\n")

def write_table_delimiter(output, max_line_length):
    for length in max_line_length:
        output.write("=" * length)
        output.write(" ")
    output.write("\n")

def format_cell(value, length):
    value = value + (" " * (length - len(value)))
    return value

def write_table(output, table):
    max_line_length = []
    for row_index, row in enumerate(table["rows"]):
        for col_index, cell in enumerate(row["cells"]):
            if row_index == 0:
                max_line_length.append(0)
            value = cell["value"]
            max_line_length[col_index] = max(
                max_line_length[col_index], len(value))
    for row_index, row in enumerate(table["rows"]):
        if row_index == 0:
            write_table_delimiter(output, max_line_length)
        for col_index, cell in enumerate(row["cells"]):
            value = cell["value"]
            output.write(format_cell(value, max_line_length[col_index]) + " ")
        output.write("\n")
        write_table_delimiter(output, max_line_length)
    output.write("\n")

arg_parser = argparse.ArgumentParser(
    description="""Convert feature files with test cases in Gherkin syntax to reStructuredText. """)
arg_parser.add_argument("-o", "--outputfile",
                        help="Output file", action="store", required=True)
arg_parser.add_argument(
    "-t", "--title", help="Chapter title", action="store", required=True)
arg_parser.add_argument(
    "-e", "--extension", help="file extension for feature files", action="store")
arg_parser.add_argument('files', metavar='FILE',
                        nargs='*', help='the files to convert')

arg_parser.parse_args()
args = arg_parser.parse_args()
parser = Parser()
extension = args.extension or ".feature"
inputfiles = []
for path in args.files:
    if os.path.isfile(path):
        inputfiles.append(path)
    else:
        for subdir, dirs, files in os.walk(path):
            for file in files:
                fileName, fileExt = os.path.splitext(file)
                if fileExt == extension:
                    inputfiles.append(os.path.join(subdir, file))

with open(args.outputfile, 'w') as output:
    write_section(output, args.title, 1)
    for f in sorted(inputfiles):
        print("%s" % f)
        ast = parser.parse(TokenScanner(f))
        feature = ast["feature"]
        feature_title = feature["name"]
        write_section(output, feature_title, 2)
        output.write(fix_indentation(feature.get("description", "")))
        output.write("\n\n")
        for child in feature["children"]:
            scenario = child.get("scenario", None)
            if scenario:
                test_title = scenario["name"]
                write_section(output, test_title, 3)
                for tag in scenario["tags"]:
                    parts = tag["name"].replace("\t", " ").split(":")
                    name = parts[0][1:]
                    if len(parts) > 1:
                        parameters = " ".join(parts[1:])
                    else:
                        parameters = ""
                    output.write("    :%s: %s\n" % (name, parameters))
                output.write("\n")
            background = child.get("background", None)
            background = child.get("background", None)
            if background:
                output.write(
                    "**Preconditions**\n\nThe following preconditions apply to all scenarios for %s:\n\n" % feature_title.lower())
            else:
                output.write("**Scenario:**\n\n")
            for step in (scenario or background).get("steps", []):
                output.write("**%s** %s\n\n" %
                             (step["keyword"].strip(), step["text"]))
                datatable = step.get("dataTable", None)
                if datatable:
                    write_table(output, datatable)
            output.write("\n")
