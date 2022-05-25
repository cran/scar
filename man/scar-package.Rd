\name{scar-package}
\alias{scar-package}
\docType{package}

\title{
Shape-Constrained Additive (index) Regression: a maximum likelihood approach
}

\description{
\pkg{scar} computes the maximum likelihood estimator of the generalised additive 
and index regression with shape constraints. Each component of the additive function of the 
predictors is assumed to belong to one of the nine possible shape restrictions: 
linear, increasing, decreasing, convex, convex and increasing, convex and decreasing, 
concave, concave and increasing, or concave and decreasing. 
For the generalised additive regression, the problem is transformed into a convex 
optimisation problem and the active set algorithm is used to find the optimum. 
We emphasise that unlike most of the other nonparametric methods, this approach is free 
of tuning parameters. 

Furthermore, we can extend our findings to the generalised additive index regression, 
where a stochastic search algorithm is proposed to solve the problem. 
}

\details{
  \tabular{ll}{
    Package: \tab scar\cr
    Type: \tab Package\cr
    Version: \tab 0.2-2\cr
    Date: \tab 2022-05-25\cr
    License: \tab GPL(>=2)\cr
  }

This package contains a selection of functions for maximum likelihood
estimation of the generalised additive (and additive index) regression under shape constraints:
  
\code{\link{scar}} computes the maximum likelihood estimator
(specified via its value at the observed covariates).  Output is a list of class
\code{\link{scar}} which is used as input to various auxiliary functions.

\code{\link{plot.scar}} produces plots of the maximum likelihood
estimator produced by \code{\link{scar}} on the scale of the additive predictors.

\code{\link{predict.scar}} obtains predictions either on the scale of the additive 
predictors or on the scale of the response variable from a fitted \code{\link{scar}} object.

\code{\link{scair}} tries to find the maximum likelihood estimator
(specified via its value at the observed indices).  Output is a list of class
\code{\link{scair}} which is used as input to various auxiliary functions.

\code{\link{plot.scair}} produces plots of the maximum likelihood
estimator produced by \code{\link{scair}} on the scale of the additive index predictors.

\code{\link{predict.scair}} obtains predictions either on the scale of the additive 
index predictors or on the scale of the response variable from a fitted \code{\link{scair}} object.

The methods proposed here were applied to the following datasets: 
\code{\link{PhDPublications}}, \code{\link{decathlon}}.
}

\author{
Yining Chen (maintainer) \email{y.chen101@lse.ac.uk}

Richard Samworth \email{r.samworth@statslab.cam.ac.uk}
}

\note{
  The authors gratefully acknowledge the assistance of Ming Yuan for his insights into this problem.

  Thanks also go to Mary Meyer for kindly providing the authors with 
  her manuscript prior to its publication.

}

\references{
Chen, Y. and Samworth, R. J. (2016).  Generalized additive and index models with shape constraints.
     Journal of the Royal Statistical Society: Series B, 78, 729-754.

Groeneboom, P., Jongbloed, G. and Wellner, J.A. (2008).
     The support reduction algorithm for computing non-parametric function 
     estimates in mixture models. Scandinavian Journal of Statistics, 35, 385-399.

Hastie, T. and Tibshirani, R. (1990) Generalized Additive Models. 
     Chapman and Hall, London.

Meyer, M. C. (2013)  Semi-parametric additive constrained regression.
     Journal of nonparametric statistics, 25, 715-743.

Nocedal, J., and Wright, S. J. (2006) Numerical Optimization, 2nd edition. 
     Springer, New York.

Robertson, T., Wright, F. T. and Dykstra, R. L. (1988). 
     Order Restricted Statistical Inference. Wiley, New York.

Venables, W. N. and Ripley, B. D. (2002) Modern Applied
     Statistics with S. Springer, New York.

Wood, S. N. (2004) Stable and efficient multiple smoothing parameter estimation 
     for generalized additive models. Journal of American Statistical Association, 
     99, 673-686.
}

\keyword{ package }
\keyword{ classes }
\keyword{ multivariate }
\keyword{ nonparametric }
\keyword{ optimize }

\seealso{
  \code{\link{scar}}, \code{\link{scair}}, \code{\link[scam:scam-package]{scam}},  
  \code{\link[stats:glm]{glm}}  
}

\examples{
## See examples provided in functions scar and scair
}
