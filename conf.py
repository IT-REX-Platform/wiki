# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'GITS - Gamified Intelligent Tutoring System'
copyright = '2023, Universität Stuttgart'
author = 'Universität Stuttgart'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = ['sphinx_rtd_theme', "myst_parser"]

templates_path = ['_templates']
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store',
        'README.md',
        'dev-manuals/README.md',
        'adr/README.md',
        'install-manuals/README.md',
        'user-manuals/README.md']



# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'sphinx_rtd_theme'
html_static_path = ['_static']

# Generate HTML anchors (test#h1-title) for titles up to h4
myst_heading_anchors = 4

myst_enable_extensions = [
        'colon_fence', # :::$TYPE\n$CONTENT\n::: == ```$TYPE\n$CONTENT\n```
        'html_admonition', # :::{attention, caution, danger, error, hint, important, note, tip, warning} $TITLE\n$CONTENT\n::: -> renders a message with the given title and content in the given style
        'tasklist', # [ ] -> unchecked checkbox, [x] -> checked checkbox
        ]