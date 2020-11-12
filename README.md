# True Make

I wanted a convenient and portable way of managing my projects.

## Usage

Simply copy, rename and change the templates as you see fit. Only commented
lines should be changed, unless you really know what you're doing.

The main way I use them is to create "debug.mk" and "release.mk" makefiles,
for the debugging and release builds respectively. I can then just invoke
them through the main Makefile (project-template.mk).

"workspace-template.mk" has few uses, its main one being that it can be used
to build a bunch of co-dependant projects.