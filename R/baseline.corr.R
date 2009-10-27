baseline.corr <- function(y, lambda = 1e7, p = 0.001)
{
  if (is.vector(y)) {
    y - asysm(y, lambda, p)
  } else {
    t(apply(y, 1, function(x) x - asysm(x, lambda, p)))
  }
}
