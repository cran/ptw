### Smooth warping demo
### Paul Eilers, 2002
### Translation to R: Jan Gerretzen, 2008

## Load and select data
data(demodata)
Y <- demodata[,2501:7500]
m <- ncol(Y)
t <- c(1:m) - 0.5

## Select signals, remove baseline
jx <- 1
jy <- 16
lambda <- 1e5
x0 <- Y[jx,]
bx0 <- asysm(x0, 1e7, 0.001, 2)
x <- x0 - bx0
y0 <- Y[jy,]
by0 <- asysm(y0, 1e7, 0.001, 2)
y <- y0 - by0

## Heavy smoothing, to broaden peaks
xs <- difsm(x, lambda, 2)
ys <- difsm(y, lambda, 2)

x11()
matplot(t, cbind(xs, ys), type="l", main='Smoothed raw data', xlab='Signal sample number', ylab='Signal')

## Compute warping function and use on unsmoothed signal
quad_res <- pmwarp(xs, ys)
w <- quad_res$w
sel <- quad_res$sel
a <- quad_res$a
rm(quad_res)
interres <- interpol(w, x)
xw <- interres$z
rm(interres)

## Plot raw data
x11()
layout(c(1,2))
matplot(t, cbind(x, y), type="l", main="Raw data", xlab='Signal sample number', ylab='Signal')
matplot(t, y - x, type="l", main='Differences between raw data traces', xlab='Signal sample number', ylab='Signal', ylim=cbind(-800, 800))

## Plot warped data
x11()
layout(c(1,2))
matplot(t[sel], cbind(y[sel], xw), type="l", main='Warped data', xlab='Signal sample number', ylab='Signal')
matplot(t[sel], y[sel] - xw, type="l", main='Differences between warped data traces', xlab='Signal sample number', ylab='Signal', ylim=cbind(-800, 800))

## Plot warping function
x11()
layout(t(c(1,2,3)))
plot(w, type="l", main='w(t)', xlab='', ylab='')
plot(w - t, type="l", main='w(t) - t', xlab='', ylab='')
par(ps=12)
plot(diff(w), type="l", main=expression(paste(Delta, "w(t)")), xlab='', ylab='')
