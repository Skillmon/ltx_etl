-------------------------------------------------------------------------------
# etl -- expandable token list operations

Version 2021-11-07 v0.3

Released under the LaTeX Project Public License v1.3c or later
See http://www.latex-project.org/lppl.txt

Hosted at https://github.com/Skillmon/ltx_etl

-------------------------------------------------------------------------------

Copyright (C) 2021-2022 Jonathan P. Spratte

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
