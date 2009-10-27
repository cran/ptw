.First.lib <- function(lib, pkg) library.dynam("ptw",pkg,lib)
.Last.lib <- function(libpath) library.dynam.unload("ptw", libpath)
