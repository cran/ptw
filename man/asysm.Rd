\name{asysm}
\alias{asysm}
\title{Trend estimation with asymmetric least squares}
\description{Estimates a trend based on asymmetric least squares. In
  this case used to estimate the baseline of a given spectrum.}
\usage{
  asysm(y, lambda = 1e7, p = 0.001)
}
\arguments{
  \item{y}{data: either a vector or a data matrix containing spectra as rows}
  \item{lambda}{smoothing parameter (generally 1e5 - 1e8)}
  \item{p}{asymmetry parameter}
}
\value{An estimated baseline}

\details{Asymmetric least squares (not to be confused with alternating
  least squares) assigns different weights to the data points that are
  above and below an iteratively estimated trendline, respectively. In
  this case, the asymmetry parameter p (0 <= p <= 1) is the weight for
  points above the trendline, whereas 1-p is the weight for points below
  it. Naturally, p should be small for estimating baselines. The
  parameter lambda controls the amount of smoothing: the larger it is,
  the smoother the trendline will be.
}
\references{Eilers, P.H.C.
  Parametric Time Warping.
  Anal. Chem., 2004, 76, 404 - 411

  Boelens, H.F.M., Eilers, P.H.C., Hankemeier, T.
  Sign constraints improve the detection of differences between complex
  spectral data sets: LC-IR as an example.
  Anal. Chem., 2005, 77, 7998-8007.
} 
\author{Paul Eilers, Jan Gerretzen}
\examples{
data(gaschrom)
plot(gaschrom[1,], type = "l", ylim = c(0, 100))
lines(asysm(gaschrom[1,]), col = 2)
}
\keyword{manip}
