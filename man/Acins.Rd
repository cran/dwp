% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fun.R
\name{Acins}
\alias{Acins}
\title{Calculate Area of Intersection inside Circle and Square with Common Center}
\usage{
Acins(r, s)
}
\arguments{
\item{r}{radius of the circle (vector or scalar)}

\item{s}{half-width of the square (scalar)}
}
\value{
vector of intersections of interiors of circles with squaure
}
\description{
Calculate Area of Intersection inside Circle and Square with Common Center
}
\examples{
 # calculate area in annulus intersecting square
s <- 10 # radius or half-width of square
r <- c(11, 12) # inner and outer radii of circle
diff(Acins(r, s)) # intersection of square and annulus
# figure to illustrate the calculated area:
theta <- seq(0, 2 * pi, length = 1500)
plot(0, xlim = max(r) * c(-1, 1), ylim = max(r) * c(-1, 1),
  xlab = "x", ylab = "y", asp = 1, bty = "n", type = "n")
xi <- r[1] * cos(theta)
yi <- r[1] * sin(theta)
xo <- r[2] * cos(theta)
yo <- r[2] * sin(theta)
i1 <- which(abs(xi) <= s & abs(yi) <= s)
i2 <- which(abs(xo) <= s & abs(yo) <= s)
i2 <- sort(i2, decreasing = TRUE)
xi <- xi[i1]
yi <- yi[i1]
xo <- xo[i2]
yo <- yo[i2]
polygon(col = 8, border = NA,
  x = c(xi[xi >= 0 & yi >= 0], xo[xo >= 0 & yo >= 0]), 
  y = c(yi[xi >= 0 & yi >= 0], yo[xo >= 0 & yo >= 0]))
polygon(col = 8, border = NA, 
  x = c(xi[xi <= 0 & yi >= 0], xo[xo <= 0 & yo >= 0]), 
  y = c(yi[xi <= 0 & yi >= 0], yo[xo <= 0 & yo >= 0]))
polygon(col = 8, border = NA,
  x = c(xi[xi <= 0 & yi <= 0], xo[xo <= 0 & yo <= 0]), 
 y = c(yi[xi <= 0 & yi <= 0], yo[xo <= 0 & yo <= 0]))
polygon(col = 8, border = NA,
 x = c(xi[xi >= 0 & yi <= 0], xo[xo >= 0 & yo <= 0]), 
 y = c(yi[xi >= 0 & yi <= 0], yo[xo >= 0 & yo <= 0]))
lines(r[1] * cos(theta), r[1]* sin(theta))
lines(r[2]* cos(theta), r[2] * sin(theta))
rect(-s, -s, s, s)
 # calculate areas in series of 1 m annuli extending to corner of square
 s <- 10.5 # radius of square (center to side)
 diff(Acins(r = 0:ceiling(sqrt(2) * s), s))
}
