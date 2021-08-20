-- Build script for etl
module     = "etl"
pkgversion = "0.1"
pkgdate    = "2021-08-17"

-- update package date and version
tagfiles = {"etl.dtx", "README.md", "CTAN.md"}
function update_tag(file, content, tagname, tagdate)
  if tagname == nil then
    tagname = pkgversion
    tagdate = pkgdate
  end
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
  ]]
}
