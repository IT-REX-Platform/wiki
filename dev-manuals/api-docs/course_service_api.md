# Course Service API

<details>
  <summary><strong>Table of Contents</strong></summary>

  * [Query](#query)
  * [Mutation](#mutation)
  * [Objects](#objects)
    * [Chapter](#chapter)
    * [ChapterPayload](#chapterpayload)
    * [Course](#course)
    * [CoursePayload](#coursepayload)
    * [CourseResourceAssociation](#courseresourceassociation)
    * [PaginationInfo](#paginationinfo)
  * [Inputs](#inputs)
    * [ChapterFilter](#chapterfilter)
    * [CourseFilter](#coursefilter)
    * [CreateChapterInput](#createchapterinput)
    * [CreateCourseInput](#createcourseinput)
    * [DateTimeFilter](#datetimefilter)
    * [IntFilter](#intfilter)
    * [Pagination](#pagination)
    * [StringFilter](#stringfilter)
    * [UpdateChapterInput](#updatechapterinput)
    * [UpdateCourseInput](#updatecourseinput)
  * [Enums](#enums)
    * [SortDirection](#sortdirection)
  * [Scalars](#scalars)
    * [Boolean](#boolean)
    * [Date](#date)
    * [DateTime](#datetime)
    * [Int](#int)
    * [LocalTime](#localtime)
    * [String](#string)
    * [Time](#time)
    * [UUID](#uuid)
    * [Url](#url)

</details>

## Query
<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>courses</strong></td>
<td valign="top"><a href="#coursepayload">CoursePayload</a>!</td>
<td>


Get a list of courses. Can be filtered, sorted and paginated.

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">filter</td>
<td valign="top"><a href="#coursefilter">CourseFilter</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">sortBy</td>
<td valign="top">[<a href="#string">String</a>!]</td>
<td>


The fields to sort by.
Throws an error if no field with the given name exists.

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">sortDirection</td>
<td valign="top">[<a href="#sortdirection">SortDirection</a>!]!</td>
<td>


The sort direction for each field. If not specified, defaults to ASC.

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">pagination</td>
<td valign="top"><a href="#pagination">Pagination</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>coursesById</strong></td>
<td valign="top">[<a href="#course">Course</a>!]!</td>
<td>


Returns the courses with the given ids.

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">ids</td>
<td valign="top">[<a href="#uuid">UUID</a>!]!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>resourceById</strong></td>
<td valign="top">[<a href="#courseresourceassociation">CourseResourceAssociation</a>!]!</td>
<td>


Returns a set of Resource Objects for the given resource ids, containing a list of all course IDs for a resource and its availability in the course.

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">ids</td>
<td valign="top">[<a href="#uuid">UUID</a>!]!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>chapters</strong></td>
<td valign="top"><a href="#chapterpayload">ChapterPayload</a>!</td>
<td>


Get the list of chapters for a course. Can be filtered, sorted and paginated.
Throws an error if the course does not exist.
The default sort order is by chapter number.

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">courseId</td>
<td valign="top"><a href="#uuid">UUID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">filter</td>
<td valign="top"><a href="#chapterfilter">ChapterFilter</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">sortBy</td>
<td valign="top">[<a href="#string">String</a>!]!</td>
<td>


The fields to sort by. The default sort order is by chapter number.
Throws an error if no field with the given name exists.

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">sortDirection</td>
<td valign="top">[<a href="#sortdirection">SortDirection</a>!]!</td>
<td>


The sort direction for each field. If not specified, defaults to ASC.

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">pagination</td>
<td valign="top"><a href="#pagination">Pagination</a></td>
<td></td>
</tr>
</tbody>
</table>

## Mutation
<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>createCourse</strong></td>
<td valign="top"><a href="#course">Course</a>!</td>
<td>


Creates a new course with the given input and returns the created course.

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">input</td>
<td valign="top"><a href="#createcourseinput">CreateCourseInput</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>createChapter</strong></td>
<td valign="top"><a href="#chapter">Chapter</a>!</td>
<td>


Creates a new chapter with the given input and returns the created chapter.
The course id must be a course id of an existing course.

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">input</td>
<td valign="top"><a href="#createchapterinput">CreateChapterInput</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>updateCourse</strong></td>
<td valign="top"><a href="#course">Course</a>!</td>
<td>


Updates an existing course with the given input and returns the updated course.
The course id must be a course id of an existing course.

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">input</td>
<td valign="top"><a href="#updatecourseinput">UpdateCourseInput</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>updateChapter</strong></td>
<td valign="top"><a href="#chapter">Chapter</a>!</td>
<td>


Updates an existing chapter with the given input and returns the updated chapter.
The chapter id must be a chapter id of an existing chapter.

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">input</td>
<td valign="top"><a href="#updatechapterinput">UpdateChapterInput</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>deleteCourse</strong></td>
<td valign="top"><a href="#uuid">UUID</a>!</td>
<td>


Deletes an existing course, throws an error if no course with the given id exists.

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">id</td>
<td valign="top"><a href="#uuid">UUID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>deleteChapter</strong></td>
<td valign="top"><a href="#uuid">UUID</a>!</td>
<td>


Deletes an existing chapter, throws an error if no chapter with the given id exists.

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">id</td>
<td valign="top"><a href="#uuid">UUID</a>!</td>
<td></td>
</tr>
</tbody>
</table>

## Objects

### Chapter


A chapter is a part of a course.

<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>id</strong></td>
<td valign="top"><a href="#uuid">UUID</a>!</td>
<td>


UUID of the chapter, generated automatically

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>title</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>


Title of the chapter, maximum length is 255 characters.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>description</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>


Description of the chapter, maximum length is 3000 characters.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>number</strong></td>
<td valign="top"><a href="#int">Int</a>!</td>
<td>


Number of the chapter, determines the order of the chapters.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>startDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>


Start date of the chapter, ISO 8601 format.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>endDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>


End date of the chapter, ISO 8601 format.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>course</strong></td>
<td valign="top"><a href="#course">Course</a>!</td>
<td>


The course the chapter belongs to.

</td>
</tr>
</tbody>
</table>

### ChapterPayload


Return type of the chapters query, contains a list of chapters and pagination info.

<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>elements</strong></td>
<td valign="top">[<a href="#chapter">Chapter</a>!]!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>pagination</strong></td>
<td valign="top"><a href="#paginationinfo">PaginationInfo</a>!</td>
<td></td>
</tr>
</tbody>
</table>

### Course


Courses are the main entity of the application. They are the top level of the
hierarchy and contain chapters.

<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>id</strong></td>
<td valign="top"><a href="#uuid">UUID</a>!</td>
<td>


UUID of the course. Generated automatically when creating a new course.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>title</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>


Title of the course. Maximal length is 255 characters, must not be blank.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>description</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>


Detailed description of the course. Maximal length is 3000 characters.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>startDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>


Start date of the course, ISO 8601 format.
Users can only access the course and work on course content after the start date.
Must be before the end date.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>endDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>


End date of the course, ISO 8601 format.
Users can no longer access the course and work on course content after the end date.
Must be after the start date.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>published</strong></td>
<td valign="top"><a href="#boolean">Boolean</a>!</td>
<td>


Published state of the course. If the course is published, it is visible to users.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>chapters</strong></td>
<td valign="top"><a href="#chapterpayload">ChapterPayload</a>!</td>
<td>


Chapters of the course. Can be filtered and sorted.

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">filter</td>
<td valign="top"><a href="#chapterfilter">ChapterFilter</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">sortBy</td>
<td valign="top">[<a href="#string">String</a>!]!</td>
<td>


The fields to sort by. The default sort order is by chapter number.
Throws an error if no field with the given name exists.

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">sortDirection</td>
<td valign="top">[<a href="#sortdirection">SortDirection</a>!]!</td>
<td>


The sort direction for each field. If not specified, defaults to ASC.

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">pagination</td>
<td valign="top"><a href="#pagination">Pagination</a></td>
<td></td>
</tr>
</tbody>
</table>

### CoursePayload


Return type for the course query. Contains the course and the pagination info.

<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>elements</strong></td>
<td valign="top">[<a href="#course">Course</a>!]!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>pagination</strong></td>
<td valign="top"><a href="#paginationinfo">PaginationInfo</a>!</td>
<td></td>
</tr>
</tbody>
</table>

### CourseResourceAssociation


Resources are all types of content present in a course. Each resource can be available or unavailable in a course.

<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>id</strong></td>
<td valign="top"><a href="#uuid">UUID</a>!</td>
<td>


UUID of the resource.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>availableCourses</strong></td>
<td valign="top">[<a href="#uuid">UUID</a>!]!</td>
<td>


A list of course IDs a resource is presently available in

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>unAvailableCourses</strong></td>
<td valign="top">[<a href="#uuid">UUID</a>!]!</td>
<td>


A list of course IDs a resource is presently unavailable in

</td>
</tr>
</tbody>
</table>

### PaginationInfo


Return type for information about paginated results.

<table>
<thead>
<tr>
<th align="left">Field</th>
<th align="right">Argument</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>page</strong></td>
<td valign="top"><a href="#int">Int</a>!</td>
<td>


The current page number.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>size</strong></td>
<td valign="top"><a href="#int">Int</a>!</td>
<td>


The number of elements per page.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>totalElements</strong></td>
<td valign="top"><a href="#int">Int</a>!</td>
<td>


The total number of elements across all pages.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>totalPages</strong></td>
<td valign="top"><a href="#int">Int</a>!</td>
<td>


The total number of pages.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>hasNext</strong></td>
<td valign="top"><a href="#boolean">Boolean</a>!</td>
<td>


Whether there is a next page.

</td>
</tr>
</tbody>
</table>

## Inputs

### ChapterFilter

<table>
<thead>
<tr>
<th colspan="2" align="left">Field</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>title</strong></td>
<td valign="top"><a href="#stringfilter">StringFilter</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>description</strong></td>
<td valign="top"><a href="#stringfilter">StringFilter</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>number</strong></td>
<td valign="top"><a href="#intfilter">IntFilter</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>startDate</strong></td>
<td valign="top"><a href="#datetimefilter">DateTimeFilter</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>endDate</strong></td>
<td valign="top"><a href="#datetimefilter">DateTimeFilter</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>and</strong></td>
<td valign="top">[<a href="#chapterfilter">ChapterFilter</a>!]</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>or</strong></td>
<td valign="top">[<a href="#chapterfilter">ChapterFilter</a>!]</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>not</strong></td>
<td valign="top"><a href="#chapterfilter">ChapterFilter</a></td>
<td></td>
</tr>
</tbody>
</table>

### CourseFilter


Input type for filtering courses. All fields are optional.
If multiple filters are specified, they are combined with AND (except for the or field).

<table>
<thead>
<tr>
<th colspan="2" align="left">Field</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>title</strong></td>
<td valign="top"><a href="#stringfilter">StringFilter</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>description</strong></td>
<td valign="top"><a href="#stringfilter">StringFilter</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>startDate</strong></td>
<td valign="top"><a href="#datetimefilter">DateTimeFilter</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>endDate</strong></td>
<td valign="top"><a href="#datetimefilter">DateTimeFilter</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>published</strong></td>
<td valign="top"><a href="#boolean">Boolean</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>and</strong></td>
<td valign="top">[<a href="#coursefilter">CourseFilter</a>!]</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>or</strong></td>
<td valign="top">[<a href="#coursefilter">CourseFilter</a>!]</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>not</strong></td>
<td valign="top"><a href="#coursefilter">CourseFilter</a></td>
<td></td>
</tr>
</tbody>
</table>

### CreateChapterInput


Input type for creating chapters.

<table>
<thead>
<tr>
<th colspan="2" align="left">Field</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>title</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>


Title of the chapter, maximum length is 255 characters, must not be blank.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>description</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>


Description of the chapter, maximum length is 3000 characters.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>number</strong></td>
<td valign="top"><a href="#int">Int</a>!</td>
<td>


Number of the chapter, determines the order of the chapters, must be positive.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>startDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>


Start date of the chapter, ISO 8601 format.
Must be before the end date.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>endDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>


End date of the chapter, ISO 8601 format.
Must be after the start date.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>courseId</strong></td>
<td valign="top"><a href="#uuid">UUID</a>!</td>
<td>


ID of the course the chapter belongs to.
Must be a UUID of an existing course.

</td>
</tr>
</tbody>
</table>

### CreateCourseInput


Input type for creating a new course. See also on the course type for detailed field descriptions.

<table>
<thead>
<tr>
<th colspan="2" align="left">Field</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>title</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>


Title of the course, max 255 characters, must not be blank.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>description</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>


Description of the course, max 3000 characters.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>startDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>


Start date of the course, ISO 8601 format.
Must be before the end date.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>endDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>


End date of the course, ISO 8601 format.
Must be after the start date.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>published</strong></td>
<td valign="top"><a href="#boolean">Boolean</a>!</td>
<td>


Published status of the course.

</td>
</tr>
</tbody>
</table>

### DateTimeFilter


Filter for date values.
If multiple filters are specified, they are combined with AND.

<table>
<thead>
<tr>
<th colspan="2" align="left">Field</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>after</strong></td>
<td valign="top"><a href="#datetime">DateTime</a></td>
<td>


If specified, filters for dates after the specified value.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>before</strong></td>
<td valign="top"><a href="#datetime">DateTime</a></td>
<td>


If specified, filters for dates before the specified value.

</td>
</tr>
</tbody>
</table>

### IntFilter


Filter for integer values.
If multiple filters are specified, they are combined with AND.

<table>
<thead>
<tr>
<th colspan="2" align="left">Field</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>equals</strong></td>
<td valign="top"><a href="#int">Int</a></td>
<td>


An integer value to match exactly.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>greaterThan</strong></td>
<td valign="top"><a href="#int">Int</a></td>
<td>


If specified, filters for values greater than to the specified value.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>lessThan</strong></td>
<td valign="top"><a href="#int">Int</a></td>
<td>


If specified, filters for values less than to the specified value.

</td>
</tr>
</tbody>
</table>

### Pagination


Specifies the page size and page number for paginated results.

<table>
<thead>
<tr>
<th colspan="2" align="left">Field</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>page</strong></td>
<td valign="top"><a href="#int">Int</a>!</td>
<td>


The page number, starting at 0.
If not specified, the default value is 0.
For values greater than 0, the page size must be specified.
If this value is larger than the number of pages, an empty page is returned.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>size</strong></td>
<td valign="top"><a href="#int">Int</a>!</td>
<td>


The number of elements per page.

</td>
</tr>
</tbody>
</table>

### StringFilter


Filter for string values.
If multiple filters are specified, they are combined with AND.

<table>
<thead>
<tr>
<th colspan="2" align="left">Field</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>equals</strong></td>
<td valign="top"><a href="#string">String</a></td>
<td>


A string value to match exactly.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>contains</strong></td>
<td valign="top"><a href="#string">String</a></td>
<td>


A string value that must be contained in the field that is being filtered.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>ignoreCase</strong></td>
<td valign="top"><a href="#boolean">Boolean</a>!</td>
<td>


If true, the filter is case-insensitive.

</td>
</tr>
</tbody>
</table>

### UpdateChapterInput


Input type for updating chapters.
The ID field specifies which chapter should be updated, all other fields specify the new values.

<table>
<thead>
<tr>
<th colspan="2" align="left">Field</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>id</strong></td>
<td valign="top"><a href="#uuid">UUID</a>!</td>
<td>


UUID of the chapter that should be updated.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>title</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>


Title of the chapter, maximum length is 255 characters, must not be blank.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>description</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>


Description of the chapter, maximum length is 3000 characters.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>number</strong></td>
<td valign="top"><a href="#int">Int</a>!</td>
<td>


Number of the chapter, determines the order of the chapters, must be positive.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>startDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>


Start date of the chapter, ISO 8601 format.
Must be before the end date.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>endDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>


End date of the chapter, ISO 8601 format.
Must be after the start date.

</td>
</tr>
</tbody>
</table>

### UpdateCourseInput


Input type for updating an existing course. See also on the course type for detailed field descriptions.
The id specifies the course that should be updated, the other fields specify the new values.

<table>
<thead>
<tr>
<th colspan="2" align="left">Field</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" valign="top"><strong>id</strong></td>
<td valign="top"><a href="#uuid">UUID</a>!</td>
<td>


UUID of the course that should be updated.
Must be an id of an existing course, otherwise an error is returned.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>title</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>


The new title of the course, max 255 characters, must not be blank.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>description</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>


The new description of the course, max 3000 characters.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>startDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>


The new start date of the course, ISO 8601 format.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>endDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>


The new end date of the course, ISO 8601 format.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>published</strong></td>
<td valign="top"><a href="#boolean">Boolean</a>!</td>
<td>


The new published status of the course.

</td>
</tr>
</tbody>
</table>

## Enums

### SortDirection


Specifies the sort direction, either ascending or descending.

<table>
<thead>
<th align="left">Value</th>
<th align="left">Description</th>
</thead>
<tbody>
<tr>
<td valign="top"><strong>ASC</strong></td>
<td></td>
</tr>
<tr>
<td valign="top"><strong>DESC</strong></td>
<td></td>
</tr>
</tbody>
</table>

## Scalars

### Boolean

Built-in Boolean

### Date

An RFC-3339 compliant Full Date Scalar

### DateTime

A slightly refined version of RFC-3339 compliant DateTime Scalar

### Int

Built-in Int

### LocalTime

24-hour clock time value string in the format `hh:mm:ss` or `hh:mm:ss.sss`.

### String

Built-in String

### Time

An RFC-3339 compliant Full Time Scalar

### UUID

A universally unique identifier compliant UUID Scalar

### Url

A Url scalar

