package = "fun-extensions"
version = "scm-1"
source = {
   url = "https://github.com/moonlibs/fun-extensions.git",
}
description = {
   homepage = "https://github.com/moonlibs/fun-extensions",
   license = "MIT"
}
dependecies = {
   "fun",
}
build = {
   type = "builtin",
   modules = {
      ["fun.yield"] = "fun/yield.lua",
   }
}
