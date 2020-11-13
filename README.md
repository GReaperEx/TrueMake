# True Make

I wanted a convenient and portable way of managing my projects.

## Usage

Simply copy, rename and change the templates as you see fit. Only commented
lines should be changed, unless you really know what you're doing.

### target-template

The most useful one of all, this makefile can be used for any project,
being short or long-term. It supports dependency files, ensuring correct
compilation, without the need to re-compile everything every single time.

### project-template

This one is just an interface between all my various compilation targets. I
mainly use it to invoke specialized "debug" and "release" templates (made from
target-template).

### workspace-template

It has few uses, the main one being that is can be used to build a bunch of
co-dependant projects.

### batch-template

That one exists so that I can compile many different sources files that may
be related, for example when I'm on a practice spree...
