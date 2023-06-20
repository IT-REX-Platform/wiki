# Flashcard concepts

This document describes how flashcards are implemented in the GITS.

## A single flashcard

A flashcard has two or more sides.
Each side has content, which can be formatted with Markdown and include images, and a label.
The label can be set by the user, e.g., 'Question' and 'Answer'; 'Front' and 'Back'; 'UML diagram'; 'Java code'; and '
Description'.
It can be defined which sides should be used as a 'Question,' i.e., which sides should be shown to the user first, so
that they have to guess the other sides.
If multiple sides are marked as question, the actual question side, which is presented to the user, is chosen randomly.
After looking at the question side, the user can choose which other sides they want to flip, so that their content is
shown.
For this, only the labels of the sides should be displayed.
After making all sides visible, the user can then decide whether they knew the associated content well or not.
They can click on a corresponding button, and the next flashcard is shown.
The more often the user estimates that they are good at the content of a flashcard, the less often the card is shown for
learning, and vice versa.

For this, a flashcard has a learning log for each user, where it stored when the user learned the flashcard, whether
they were successful or not, and a learning interval, after which the flashcard should be learned again.

## A flashcard set

We decided to not consider a single flashcard a subclass of content, because a flashcard is not a learning unit on its
own and the content overview page would possibly be cluttered with all the single flashcards.
Instead, we decided to introduce a new concept, the flashcard set, which is a subclass of content and contains multiple
flashcards from the same topic.

Thus, a flashcard set is an assessment which can displayed in a content overview page and which contains multiple
flashcards.
Additionally, it is possible to learn all flashcards of a chapter or course at once, so that the user does not have to
learn each flashcard set individually.