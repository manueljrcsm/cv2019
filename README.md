# One-page CV and cover letter templates

Contains two class files `twentysecondcv.cls` and `cover.cls` for a one-page CV
and cover letter, respectively.
The `cls` files  handle the stylistic presentation of the files and can be
tweaked at will.

The main `tex` files call these classes via `\documentclass{twentysecondcv}` or
`\documentclass{cover}` and can take document options from the class `article`
as normally. Templates of the `tex` files are included.

Content of the CV or the cover letter, i.e., everything that relates to the 
actual information about the candidate or the job position should be in the
`tex` files and not in the `cls` files.

All media should be placed in the `\images` subfolder, in particular the 
`portrait.png` and `signature.png` files, which are expected in the template.
These can be renamed in the `tex` files at will.

## TODO LIST:
~~Write README~~