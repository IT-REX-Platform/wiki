# How to add a new folder to ReadTheDocs

1. Find the nearest `index.rst` in the parents of the folder.
2. Add the following code block at the intended TOC location:

```rst

.. toctree::
   :glob:
   :titlesonly:
   :caption: $CAPTION

   ./$FOLDER/*
```

where `$CAPTION` is effectively the folder name in normal English and `$FOLDER` is the new folder to add.

3. If the folder is of the form `$a/$b/.../$c` and it should be added to `$a/index.rst`, the last line should be `./$b/**` instead. This change includes all subdirectories as well and is hence more useful in this case.
