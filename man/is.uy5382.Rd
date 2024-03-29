% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{is.uy5382}
\alias{is.uy5382}
\title{This function test if an 'sf' object match with Uruguay at crs = 5382.}
\usage{
is.uy5382(x)
}
\arguments{
\item{x}{An 'sf' object with the same crs as the homonym parameter}
}
\value{
logical value based in crs parameter of the sf object
}
\description{
This function test if an 'sf' object match with Uruguay at crs = 5382.
}
\examples{
\donttest{
is.uy5382(load_geouy("Uruguay"))
}
}
\seealso{
Other crs: 
\code{\link{is.uy32721}()},
\code{\link{is.uy4326}()},
\code{\link{is.uy5381}()}
}
\concept{crs}
\keyword{CRS}
\keyword{Uruguay}
\keyword{sf}
