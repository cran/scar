\name{plot.scar}
\alias{plot.scar}

\title{Plot components of a "scar" object}

\description{This function takes a fitted \pkg{scar} object produced 
     by \code{\link{scar}} and plots the component functions that make it 
     up, on the scale of the additive predictors.
}

\usage{
\method{plot}{scar}(x, addp = TRUE, ...)
}

\arguments{
     \item{x}{a fitted \pkg{scar} object produced 
       by \code{\link{scar}}}

     \item{addp}{a \code{logical} scalar that indicates whether the data points 
       should be plotted as circles on the fitted curves of each component.}

     \item{...}{Other arguments passed to \code{plot}}
}

\details{
     A plot is produced for each additive component in the fitted \pkg{scar} 
     object. Each function is plotted in the range of the observed covariates, 
     with the identifiability condition satisfied (see Details of \code{\link{scar}}).

     It can be invoked by calling \code{"plot(x)"} for an object x of the
     \pkg{scar} class, or directly by calling \code{"plot.scar(x)"} regardless
     of the class of the object.
}

\author{Yining Chen and Richard Samworth}

\seealso{\code{\link{scar}}, \code{\link{predict.scar}}}

\examples{
## see examples for the function scar
}

\keyword{ dplot }
\keyword{ hplot }
