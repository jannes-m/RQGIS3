% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helper_funs.R
\name{save_spatial_objects}
\alias{save_spatial_objects}
\title{Save spatial objects}
\usage{
save_spatial_objects(params, type_name, NA_flag = -99999)
}
\arguments{
\item{params}{A parameter-argument list as returned by \code{\link[=pass_args]{pass_args()}}.}

\item{type_name}{A character string containing the QGIS parameter type for
each parameter (boolean, multipleinput, extent, number, etc.) of \code{params}.
The Python method \code{RQGIS3.get_args_man()} returns a Python dictionary with
one of its elements corresponding to the type_name (see also the example
section).}

\item{NA_flag}{Value used for NAs when exporting raster objects.}
}
\description{
The function saves spatial objects (\code{sp}, \code{sf} and \code{raster}) to
a temporary folder on the computer's hard drive.
}
\examples{
\dontrun{
library("RQGIS3")
library("raster")
library("reticulate")
r = raster(ncol = 100, nrow = 100)
r1 = crop(r, extent(-10, 11, -10, 11))
r2 = crop(r, extent(0, 20, 0, 20))
r3 = crop(r, extent(9, 30, 9, 30))
r1[] = 1:ncell(r1)
r2[] = 1:ncell(r2)
r3[] = 1:ncell(r3)
alg = "grass7:r.patch"
out = py$RQGIS3$get_args_man(alg)
params = get_args_man(alg)
params$input = list(r1, r2, r3)
params[] = save_spatial_objects(params = params,
                                type_name = out$type_name)
}
}
\author{
Jannes Muenchow
}
\keyword{internal}
