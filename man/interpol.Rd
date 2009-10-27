\name{interpol}
\alias{interpol}
\title{Linear interpolation}
\description{This function calculates values at non-integer index
  positions by linear interpolation.}
\usage{interpol(xout, y)}
\arguments{
  \item{xout}{points at which to compute interpolated values}
  \item{y}{signal to be interpolated}
}
\value{A vector of interpolated values. If any of the values of
  \code{xout} are outside the domain \code{1:length(y)} the output will
  contain NA at those positions
}
\author{Paul Eilers, Jan Gerretzen, Ron Wehrens}
\examples{
interpol(seq(23, 25, length = 20),10:50)
interpol(seq(23, 25, length = 20),5:50)
}
\keyword{manip}
