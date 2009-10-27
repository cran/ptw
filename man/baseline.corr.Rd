\name{baseline.corr}
\alias{baseline.corr}
\title{Baseline Correction using asymmetric least squares}
\description{This function estimates a baseline using asymmetric least
  squares and subtracts it from the data.} 
\usage{
baseline.corr(y, lambda = 1e7, p = 0.001)
}
\arguments{
  \item{y}{signal(s) to correct. This can be a vector (containing one
    signal) or a matrix of signals(one signal per row)} 
  \item{lambda}{smoothing parameter for weighted asymmetric least
    squares baseline estimation.} 
  \item{p}{asymmetry parameter for weighted asymmetric least squares
    baseline estimation} 
}
\value{
  \item{ycorr}{baseline corrected signal(s): a vector or a matrix of the
    same dimension as the input signal(s)}
}
\references{Eilers, P.H.C. Parametric Time Warping.
  Anal. Chem., 2004, 76, 404 - 411
}
\author{Paul Eilers, Jan Gerretzen}
\examples{
data(gaschrom)
plot(gaschrom[1,], type = "l", ylim = c(0, 100))
lines(baseline.corr(gaschrom[1,]), col = 2)
}
\keyword{manip}
