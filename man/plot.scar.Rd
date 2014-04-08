\name{plot.scar}
\alias{plot.scar}

\title{Plot components of a "scar" object}

\description{This function takes a fitted \code{scar} object produced 
     by \code{\link{scar}} and plots the component functions that make it 
     up, on the scale of the additive predictors.
}

\usage{
\method{plot}{scar}(x, whichplot = 1:d, addp = TRUE, ...)
}

\arguments{
     \item{x}{A fitted \code{scar} object produced 
       by \code{\link{scar}}.}

     \item{whichplot}{A numeric vector indicates the required plots.}

     \item{addp}{A \code{logical} scalar that indicates whether the data points 
       should be plotted as circles on the fitted curves of each component.}

     \item{...}{Other arguments passed to \code{plot}.}
}

\details{
     A plot is produced for each additive component in the fitted \code{scar} 
     object. Each function is plotted in the range of the observed covariates, 
     with the identifiability condition satisfied (see Details of \code{\link{scar}}).

     It can be invoked by calling \code{"plot(x)"} for an object \code{x} of the
     \code{scar} class, or directly by calling \code{"plot.scar(x)"} regardless
     of the class of the object.
}

\author{Yining Chen and Richard Samworth}

\seealso{\code{\link{scar}}, \code{\link{predict.scar}}, \code{\link{plot.scair}}}

\examples{
## See examples for the function scar
}

\keyword{ hplot }
\keyword{ dplot }
