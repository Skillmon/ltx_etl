-- Build script for etl
module     = "etl"
pkgversion = "0.4"
pkgdate    = "2025-02-02"

-- update package date and version
tagfiles = {"etl.dtx", "README.md", "CTAN.md"}
function update_tag(file, content, tagname, tagdate)
  if tagname == nil then
    tagname = pkgversion
    tagdate = pkgdate
  end
  -- update copyright notices
  _, _, tagyear = string.find(tagdate, "(%d%d%d%d)")
  content = string.gsub(content,
    "(Copyright%s*%(C%)%s*%d%d%d%d%-)%d%d%d%d",
    "%1" .. tagyear)
  if string.match(file, "%.md") then
    return string.gsub(content,
      "%d%d%d%d%-%d%d%-%d%d v%d%.%d%w?",
      tagdate .. " v" .. tagname)
  elseif string.match(file, "etl.dtx") then
    return string.gsub(content,
      "  {%d%d%d%d%-%d%d%-%d%d} {%d%.%d%w?}",
      "  {" .. tagdate .. "} {" .. tagname .. "}")
  end
  return content
end

-- test with pdfTeX and the LaTeX format
checkengines = {"pdftex"}
checkformat  = "latex"

-- from which files to build
sourcefiles = {"etl.dtx"}
unpackfiles = sourcefiles

-- which files to put in the tds
installfiles = {"etl.sty"}
textfiles    = {"README.md", "CTAN.md"}
docfiles     = {"etl.pdf"}

-- how the documentation is build
typesetfiles = {"etl.dtx"}
typesetruns  = 4

-- CTAN upload
ctanreadme    = "CTAN.md"
uploadconfig  = {
  pkg         = module,
  author      = "Jonathan P. Spratte",
  version     = pkgversion .. " " .. pkgdate,
  license     = "lppl1.3c",
  summary     = "expandable token list operations",
  topic       = {"latex3","macro-supp"},
  ctanPath    = "/macros/latex/contrib/etl",
  repository  = "https://github.com/Skillmon/ltx_etl",
  bugtracker  = "https://github.com/Skillmon/ltx_etl/issues",
  update      = true,
  description = [[
`etl` provides expandable token list operations for which `expl3`'s `l3tl` only
has unexpandable variants. These expandable versions are typically slower than
the unexpandable code. Unlike the `l3tl` versions the functions in this module
might contain braces and macro parameter tokens in their arguments, but as a
drawback they can't distinguish some tokens and don't consider the character
code of group-begin and group-end tokens.

Additionally a general map to token lists is provided, modelled after the
`expl3` internal `\__tl_act:NNNn` but with additional features.
  ]]
}
