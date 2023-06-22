# Add-tag-to-content

## Create tag



### Lecturer wants to add a new tag to an existing content with name "ContentX" in an existing chapter with title "ChapterX" for an existing course with title "CourseX"


**Scenario:**

**Given** lecturer is logged in

**And** a course exists with title "CourseX"

**And** a chapter exists with title "ChapterX" for course with title "CourseX"

**And** a content exists with name "ContentX" for chapter with title "ChapterX"

**And** no tag exists with name "TagX" for content with name "ContentX"

**When** the lecturer clicks the "create tag" button to add a tag with name "TagX" to a content with name "ContentX" for chapter with title "ChapterX"

**Then** a new tag with name "TagX" exists for content with name "ContentX"


### Lecturer wants to add an already existing tag to an existing content with name "ContentX" in an existing chapter with title "ChapterX" for an existing course with title "CourseX"


**Scenario:**

**Given** lecturer is logged in

**And** a course exists with title "CourseX"

**And** a chapter exists with title "ChapterX" for course with title "CourseX"

**And** a content exists with name "ContentX" for chapter with title "ChapterX"

**And** a tag exists with name "TagX" for content with name "ContentX"

**When** the lecturer clicks the "create tag" button to add a tag with name "TagX" to a content with name "ContentX" for chapter with title "ChapterX"

**Then** no new tag is added to content with name "ContentX"

**And** a single tag with name "TagX" exists for content with name "ContentX"


