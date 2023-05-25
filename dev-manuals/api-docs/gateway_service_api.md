# Gateway Service API

<details>
  <summary><strong>Table of Contents</strong></summary>

  * [Query](#query)
  * [Mutation](#mutation)
  * [Objects](#objects)
    * [Chapter](#chapter)
    * [Content](#content)
    * [Course](#course)
    * [DownloadUrl](#downloadurl)
    * [MediaRecord](#mediarecord)
    * [PaginationInfo](#paginationinfo)
    * [Tag](#tag)
    * [UploadUrl](#uploadurl)
  * [Inputs](#inputs)
    * [CreateBucketInput](#createbucketinput)
    * [CreateChapterInput](#createchapterinput)
    * [CreateContentInput](#createcontentinput)
    * [CreateCourseInput](#createcourseinput)
    * [CreateMediaRecordInput](#createmediarecordinput)
    * [CreateTagInput](#createtaginput)
    * [CreateUrlInput](#createurlinput)
    * [DateTimeFilter](#datetimefilter)
    * [IntFilter](#intfilter)
    * [Pagination](#pagination)
    * [StringFilter](#stringfilter)
    * [UpdateChapterInput](#updatechapterinput)
    * [UpdateContentInput](#updatecontentinput)
    * [UpdateCourseInput](#updatecourseinput)
    * [UpdateMediaRecordInput](#updatemediarecordinput)
    * [UpdateTagInput](#updatetaginput)
  * [Enums](#enums)
    * [MediaType](#mediatype)
    * [SortDirection](#sortdirection)
  * [Scalars](#scalars)
    * [Boolean](#boolean)
    * [Date](#date)
    * [DateTime](#datetime)
    * [Int](#int)
    * [LocalTime](#localtime)
    * [ResolveToSourceArgs](#resolvetosourceargs)
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
<td valign="top">[<a href="#course">Course</a>!]!</td>
<td>

 get all courses

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>coursesById</strong></td>
<td valign="top">[<a href="#course">Course</a>!]!</td>
<td>

 get courses by ids

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">ids</td>
<td valign="top">[<a href="#uuid">UUID</a>!]!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>mediaRecordsById</strong></td>
<td valign="top">[<a href="#mediarecord">MediaRecord</a>!]!</td>
<td>

 Returns the media records with the given IDs

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">ids</td>
<td valign="top">[<a href="#uuid">UUID</a>!]!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>mediaRecords</strong></td>
<td valign="top">[<a href="#mediarecord">MediaRecord</a>!]!</td>
<td>

 Returns all media records

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>mediaRecordsByContentIds</strong></td>
<td valign="top">[[<a href="#mediarecord">MediaRecord</a>!]!]!</td>
<td>

 Returns the media records associated the given content IDs as a list of lists where each sublist contains
 the media records associated with the content ID at the same index in the input list

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">contentIds</td>
<td valign="top">[<a href="#uuid">UUID</a>!]!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>contents</strong></td>
<td valign="top">[<a href="#content">Content</a>]</td>
<td>

 get all contents

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>tags</strong></td>
<td valign="top">[<a href="#tag">Tag</a>]</td>
<td>

 get all tags

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>contentsById</strong></td>
<td valign="top">[<a href="#content">Content</a>!]!</td>
<td>

 get contents by ids

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">ids</td>
<td valign="top">[<a href="#uuid">UUID</a>!]!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>contentsByChapterIds</strong></td>
<td valign="top">[[<a href="#content">Content</a>!]!]!</td>
<td>

 get contents by chapter ids. Returns a list containing sublists, where each sublist contains all contents
 associated with that chapter

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">chapterIds</td>
<td valign="top">[<a href="#uuid">UUID</a>!]!</td>
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

 Create a new course

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

 Create a new chapter

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

 Update an existing course

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

 Update an existing chapter

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">input</td>
<td valign="top"><a href="#updatechapterinput">UpdateChapterInput</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>deleteCourse</strong></td>
<td valign="top"><a href="#uuid">UUID</a></td>
<td>

 Delete an existing course

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">id</td>
<td valign="top"><a href="#uuid">UUID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>deleteChapter</strong></td>
<td valign="top"><a href="#uuid">UUID</a></td>
<td>

 Delete an existing chapter

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">id</td>
<td valign="top"><a href="#uuid">UUID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>createMediaRecord</strong></td>
<td valign="top"><a href="#mediarecord">MediaRecord</a>!</td>
<td>

 Creates a new media record

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">input</td>
<td valign="top"><a href="#createmediarecordinput">CreateMediaRecordInput</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>updateMediaRecord</strong></td>
<td valign="top"><a href="#mediarecord">MediaRecord</a>!</td>
<td>

 Updates an existing media record with the given UUID

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">input</td>
<td valign="top"><a href="#updatemediarecordinput">UpdateMediaRecordInput</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>deleteMediaRecord</strong></td>
<td valign="top"><a href="#uuid">UUID</a>!</td>
<td>

 Deletes the media record with the given UUID

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">id</td>
<td valign="top"><a href="#uuid">UUID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>createStorageUploadUrl</strong></td>
<td valign="top"><a href="#uploadurl">UploadUrl</a></td>
<td>

 Creates a new upload URL for the given media record

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">input</td>
<td valign="top"><a href="#createurlinput">CreateUrlInput</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>createStorageDownloadUrl</strong></td>
<td valign="top"><a href="#downloadurl">DownloadUrl</a></td>
<td>

 Creates a new download URL for the given media record

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">input</td>
<td valign="top"><a href="#createurlinput">CreateUrlInput</a></td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>createContent</strong></td>
<td valign="top"><a href="#content">Content</a>!</td>
<td>

 Create a new Content

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">input</td>
<td valign="top"><a href="#createcontentinput">CreateContentInput</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>updateContent</strong></td>
<td valign="top"><a href="#content">Content</a>!</td>
<td>

 Update an existing Content

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">input</td>
<td valign="top"><a href="#updatecontentinput">UpdateContentInput</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>deleteContent</strong></td>
<td valign="top"><a href="#uuid">UUID</a>!</td>
<td>

 Delete an existing Content, throws an error if no Content with the given id exists

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">id</td>
<td valign="top"><a href="#uuid">UUID</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>createTag</strong></td>
<td valign="top"><a href="#tag">Tag</a>!</td>
<td>

 Create a new Tag

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">input</td>
<td valign="top"><a href="#createtaginput">CreateTagInput</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>updateTag</strong></td>
<td valign="top"><a href="#tag">Tag</a>!</td>
<td>

 Update an existing Tag

</td>
</tr>
<tr>
<td colspan="2" align="right" valign="top">input</td>
<td valign="top"><a href="#updatetaginput">UpdateTagInput</a>!</td>
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>deleteTag</strong></td>
<td valign="top"><a href="#uuid">UUID</a>!</td>
<td>

 Delete an existing Tag, throws an error if no Tag with the given id exists

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

 Chapter of a course

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

 UUID of the chapter

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>title</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

 Title of the chapter, max 255 characters

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>description</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

 Description of the chapter, max 3000 characters

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>number</strong></td>
<td valign="top"><a href="#int">Int</a>!</td>
<td>

 Number of the chapter, determines the order of the chapters

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>startDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>

 Start date of the chapter, ISO 8601 format

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>endDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>

 End date of the chapter, ISO 8601 format

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>course</strong></td>
<td valign="top"><a href="#course">Course</a>!</td>
<td>

 The course the chapter belongs to

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>contents</strong></td>
<td valign="top">[<a href="#content">Content</a>!]!</td>
<td></td>
</tr>
</tbody>
</table>

### Content

 schema file of the microservice

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

 ID of the content

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>name</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

 name of the content

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>rewardPoints</strong></td>
<td valign="top"><a href="#int">Int</a>!</td>
<td>

 Number of reward points a student receives for completing this content

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>workedOn</strong></td>
<td valign="top"><a href="#boolean">Boolean</a>!</td>
<td>

 purpose unclear

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>tags</strong></td>
<td valign="top">[<a href="#tag">Tag</a>]!</td>
<td>

 Tags this content is tagged with

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>chapterId</strong></td>
<td valign="top"><a href="#uuid">UUID</a>!</td>
<td>

 ID of the chapter this content is associated with

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>mediaRecords</strong></td>
<td valign="top">[<a href="#mediarecord">MediaRecord</a>!]!</td>
<td></td>
</tr>
</tbody>
</table>

### Course

 Course of the application

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

 UUID of the course

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>title</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

 Title of the course, max 255 characters

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>description</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

 Description of the course, max 3000 characters

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>startDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>

 Start date of the course, ISO 8601 format

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>endDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>

 End date of the course, ISO 8601 format

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>published</strong></td>
<td valign="top"><a href="#boolean">Boolean</a>!</td>
<td>

 Published status of the course

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>chapters</strong></td>
<td valign="top">[<a href="#chapter">Chapter</a>!]!</td>
<td>

 Chapters of the course

</td>
</tr>
</tbody>
</table>

### DownloadUrl

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
<td colspan="2" valign="top"><strong>url</strong></td>
<td valign="top"><a href="#string">String</a></td>
<td></td>
</tr>
</tbody>
</table>

### MediaRecord

 schema file of the microservice
 defines data types, queries and mutations
 this can be done in a separate files as long as they are in this folder and
 end with .graphqls

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

 ID of the media record

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>name</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

 Name of the media record

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>type</strong></td>
<td valign="top"><a href="#mediatype">MediaType</a>!</td>
<td>

 Type of the media record

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>contentIds</strong></td>
<td valign="top">[<a href="#uuid">UUID</a>!]!</td>
<td>

 IDs of the MediaContents this media record is associated with

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

### Tag

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
<td colspan="2" valign="top"><strong>name</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

 Name of the tag

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>id</strong></td>
<td valign="top"><a href="#uuid">UUID</a>!</td>
<td>

 ID of the tag

</td>
</tr>
</tbody>
</table>

### UploadUrl

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
<td colspan="2" valign="top"><strong>url</strong></td>
<td valign="top"><a href="#string">String</a></td>
<td></td>
</tr>
</tbody>
</table>

## Inputs

### CreateBucketInput

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
<td colspan="2" valign="top"><strong>bucketId</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td></td>
</tr>
</tbody>
</table>

### CreateChapterInput

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

 Title of the chapter, max 255 characters

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>description</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

 Description of the chapter, max 3000 characters

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>number</strong></td>
<td valign="top"><a href="#int">Int</a>!</td>
<td>

 Number of the chapter, determines the order of the chapters

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>startDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>

 Start date of the chapter, ISO 8601 format

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>endDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>

 End date of the chapter, ISO 8601 format

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>courseId</strong></td>
<td valign="top"><a href="#uuid">UUID</a>!</td>
<td>

 The course the chapter belongs to

</td>
</tr>
</tbody>
</table>

### CreateContentInput

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
<td colspan="2" valign="top"><strong>name</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

 name of the content, max 255 characters, cannot be empty

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>rewardPoints</strong></td>
<td valign="top"><a href="#int">Int</a>!</td>
<td>

 Number of reward points a student receives for completing this content

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>workedOn</strong></td>
<td valign="top"><a href="#boolean">Boolean</a>!</td>
<td>

 purpose unclear

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>chapterId</strong></td>
<td valign="top"><a href="#uuid">UUID</a>!</td>
<td>

 chapter id the content will be associated with

</td>
</tr>
</tbody>
</table>

### CreateCourseInput

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

 Title of the course, max 255 characters

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>description</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

 Description of the course, max 3000 characters

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>startDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>

 Start date of the course, ISO 8601 format

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>endDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>

 End date of the course, ISO 8601 format

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>published</strong></td>
<td valign="top"><a href="#boolean">Boolean</a>!</td>
<td>

 Published status of the course

</td>
</tr>
</tbody>
</table>

### CreateMediaRecordInput

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
<td colspan="2" valign="top"><strong>name</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

 Name of the media record. Cannot be blank, maximum length 255 characters.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>type</strong></td>
<td valign="top"><a href="#mediatype">MediaType</a>!</td>
<td>

 Type of the media record.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>contentIds</strong></td>
<td valign="top">[<a href="#uuid">UUID</a>!]!</td>
<td>

 IDs of the MediaContents this media record is associated with

</td>
</tr>
</tbody>
</table>

### CreateTagInput

 Input type used to create a new tag

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
<td colspan="2" valign="top"><strong>name</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

 name of the tag, max 255 characters

</td>
</tr>
</tbody>
</table>

### CreateUrlInput

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
<td></td>
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
<td></td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>title</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

 Title of the chapter, max 255 characters

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>description</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

 Description of the chapter, max 3000 characters

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>number</strong></td>
<td valign="top"><a href="#int">Int</a>!</td>
<td>

 Number of the chapter, determines the order of the chapters

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>startDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>

 Start date of the chapter, ISO 8601 format

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>endDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>

 End date of the chapter, ISO 8601 format

</td>
</tr>
</tbody>
</table>

### UpdateContentInput

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

 ID of the content that should be updated

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>name</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

 new name of the content, max 255 characters

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>rewardPoints</strong></td>
<td valign="top"><a href="#int">Int</a>!</td>
<td>

 new reward points of the content

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>workedOn</strong></td>
<td valign="top"><a href="#boolean">Boolean</a>!</td>
<td>

 new value for "workedOn" field of the content

</td>
</tr>
</tbody>
</table>

### UpdateCourseInput

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

 UUID of the course

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>title</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

 Title of the course, max 255 characters

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>description</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

 Description of the course, max 3000 characters

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>startDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>

 Start date of the course, ISO 8601 format

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>endDate</strong></td>
<td valign="top"><a href="#datetime">DateTime</a>!</td>
<td>

 End date of the course, ISO 8601 format

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>published</strong></td>
<td valign="top"><a href="#boolean">Boolean</a>!</td>
<td>

 Published status of the course

</td>
</tr>
</tbody>
</table>

### UpdateMediaRecordInput

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

 ID of the media record which should be updated

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>name</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

 New name of the media record. Cannot be blank, maximum length 255 characters.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>type</strong></td>
<td valign="top"><a href="#mediatype">MediaType</a>!</td>
<td>

 New type of the media record.

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>contentIds</strong></td>
<td valign="top">[<a href="#uuid">UUID</a>!]!</td>
<td>

 IDs of the MediaContents this media record is associated with

</td>
</tr>
</tbody>
</table>

### UpdateTagInput

 Input type used to update an existing tag

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

 ID of the tag to update

</td>
</tr>
<tr>
<td colspan="2" valign="top"><strong>name</strong></td>
<td valign="top"><a href="#string">String</a>!</td>
<td>

 New name of the tag

</td>
</tr>
</tbody>
</table>

## Enums

### MediaType

 The type of the media record

<table>
<thead>
<th align="left">Value</th>
<th align="left">Description</th>
</thead>
<tbody>
<tr>
<td valign="top"><strong>VIDEO</strong></td>
<td></td>
</tr>
<tr>
<td valign="top"><strong>AUDIO</strong></td>
<td></td>
</tr>
<tr>
<td valign="top"><strong>IMAGE</strong></td>
<td></td>
</tr>
<tr>
<td valign="top"><strong>PRESENTATION</strong></td>
<td></td>
</tr>
<tr>
<td valign="top"><strong>DOCUMENT</strong></td>
<td></td>
</tr>
<tr>
<td valign="top"><strong>URL</strong></td>
<td></td>
</tr>
</tbody>
</table>

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

The `Boolean` scalar type represents `true` or `false`.

### Date

An RFC-3339 compliant Full Date Scalar

### DateTime

A slightly refined version of RFC-3339 compliant DateTime Scalar

### Int

The `Int` scalar type represents non-fractional signed whole numeric values. Int can represent values between -(2^31) and 2^31 - 1.

### LocalTime

24-hour clock time value string in the format `hh:mm:ss` or `hh:mm:ss.sss`.

### ResolveToSourceArgs

### String

The `String` scalar type represents textual data, represented as UTF-8 character sequences. The String type is most often used by GraphQL to represent free-form human-readable text.

### Time

An RFC-3339 compliant Full Time Scalar

### UUID

A universally unique identifier compliant UUID Scalar

### Url

A Url scalar

