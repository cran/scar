\name{plot.scair}
\alias{plot.scair}

\title{Plot additive index components of a "scair" object}

\description{This function takes a fitted \code{scair} object produced 
     by \code{\link{scair}} and plots the component functions of the additive indices
     that make it up, on the scale of the additive index predictors.
}

\usage{
\method{plot}{scair}(x, whichplot = 1:m, addp = TRUE, ...)
}

\arguments{
     \item{x}{A fitted \code{scair} object produced 
       by \code{\link{scair}}.}

     \item{whichplot}{A numeric vector indicates the required plots.}

     \item{addp}{A \code{logical} scalar that indicates whether the data points 
       should be plotted as circles on the fitted curves of each component.}

     \item{...}{Other arguments passed to \code{plot}.}
}

\details{
     A plot is produced for each additive index component function in the fitted 
     \code{scair} object. Each function is plotted in the range of the observed indices, 
     with the identifiability condition satisfied (see Details of \code{\link{scar}} 
     and \code{\link{scair}}).
}

\author{Yining Chen and Richard Samworth}

\seealso{\code{\link{scair}}, \code{\link{predict.scair}}, \code{\link{plot.scar}}}

\examples{
## See examples for the function scair
}

\keyword{ hplot }
\keyword{ dplot }
