\name{predict.scar}
\alias{predict.scar}

\title{
Predict method for \code{scar} fits
}

\description{
This function obtains predictions from a fitted \code{scar} object.
}

\usage{
\method{predict}{scar}(object, newdata, type = c("link", "response"), rule=1, ...)
}

\arguments{
  \item{object}{A fitted \code{scar} object produced by \code{\link{scar}}.}

  \item{newdata}{An optional numeric \code{matrix} of \eqn{d} columns, with each row 
          specifying a location at which prediction is required. This argument can be 
          missing, in which case predictions are made at the same values of the 
          covariates used to compute the object.}

  \item{type}{Type of predictions, with choices "link" (the default),
          or "response". The default produces predictions on the scale of the additive 
          predictors. If "response" is selected, the predictions are on the scale of the 
          response (i.e. mean of the exponential family), and are monotone 
          transformations of the additive predictors using the inverse link function.}

  \item{rule}{An integer describing how to handle the new data outside the range of the 
          observed covariates. If \code{rule=1}, then we use linear interpolation to get 
          the value of each fitted component function outside the range of observed 
          covariates. Otherwise if \code{rule=2}, then the value at the closest data 
          extreme is used. Note that if there is convex/concave component, the choice of 
          the first rule can lead to somewhat unsatifactary performance 
          on/outside the boundary of the data (when comparing to the second rule).}

  \item{...}{Further arguments passed to or from other methods.}
}

\value{A numeric vector of predictions.}

\author{Yining Chen and Richard Samworth}

\seealso{\code{\link{scar}}, \code{\link{plot.scar}}}

\examples{
## See examples for the function scar
}

\keyword{ multivariate }
\keyword{ nonparametric }
\keyword{ prediction }
