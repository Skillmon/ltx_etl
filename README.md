-------------------------------------------------------------------------------
# etl -- expandable token list operations

Version 2021-07-15 v1.9

Released under the LaTeX Project Public License v1.3c or later
See http://www.latex-project.org/lppl.txt

Hosted at https://github.com/Skillmon/ltx_etl

-------------------------------------------------------------------------------

Copyright (C) 2020-2021 Jonathan P. Spratte

This  work may be  distributed and/or  modified under  the conditions  of the
LaTeX Project Public License (LPPL),  either version 1.3c  of this license or
(at your option) any later version.  The latest version of this license is in
the file:

  http://www.latex-project.org/lppl.txt

This work is "maintained" (as per LPPL maintenance status) by
  Jonathan P. Spratte.

-------------------------------------------------------------------------------

This provides expandable token list operations which are only implemented
unexpandably inside of `expl3`'s `l3tl` module. While being expandable these
operations are typically slower than the unexpandable alternatives. Also there
are tokens which are not expandably distinguishable in TeX (those are active
characters which are let to the same character with a different category code).

Additionally a general map to token lists is provided modelled after
`\__tl_act:NNNn` with additional features.

# Building etl

The only place where version numbers and dates are guaranteed to be correct in
the repository is in the `l3build` configuration file `build.lua`. If it is
important to you that the files created have the correct version and date, you
should run `l3build tag` before any other build-related task.

`etl` utilizes the `l3build` system. You can run `l3build unpack` to extract
the code file `etl.sty` into the directory `build/unpacked/`.  If you want to
build the documentation run `l3build doc`, the resulting PDF will be in the main
directory. Running `l3build install` will put `etl.sty` in your `TEXMFHOME`,
`l3build uninstall` will remove it. `l3build` should be contained in any recent
LaTeX installation.

You can run the checks from the folder `testfiles/` by running `l3build check`
to test whether the version you got has any regressions.

Of course you can also build everything manually. `pdftex etl.dtx` will generate
the code files, `pdflatex etl.dtx` will create the documentation, but you'll
have to run that at least twice, and if you want an index you'll also have to
run `makeindex -s gind.ist -o etl.ind etl.idx` and then rerun `pdflatex`.
Building the files manually will create quite a few auxiliary files in the main
directory.
