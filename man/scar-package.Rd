\name{scar-package}
\alias{scar-package}
\docType{package}

\title{
Shape-constrained additive regression: a maximum likelihood approach
}

\description{
\pkg{scar} computes the maximum likelihood estimator of the generalised additive 
regression with shape constraints. Each component of the additive function of the 
predictors is assumed to belong to one of the nine possible shape restrictions: 
linear, increasing, decreasing, convex, convex and increasing, convex and decreasing, 
concave, concave and increasing, or concave and decreasing. 
This problem is transformed into a convex optimisation problem and the active set 
algorithm is used to find the optimum. We emphasise that unlike most of the other 
nonparametric methods, this approach is free of tuning parameters.
}

\details{
  \tabular{ll}{
    Package: \tab scar\cr
    Type: \tab Package\cr
    Version: \tab 0.1-0\cr
    Date: \tab 2013-07-18\cr
    License: \tab GPL(>=2)\cr
  }

This package contains a selection of functions for maximum likelihood
estimation of the generalised additive regression under shape constraints:
  
\code{\link{scar}} computes the maximum likelihood estimator
(specified via its value at the observed covariates).  Output is a list of class
\pkg{scar} which is used as input to various auxiliary functions.

\code{\link{plot.scar}} produces plots of the maximum likelihood
estimator on the scale of the additive predictors.

\code{\link{predict.scar}} obtains predictions either on the scale of the additive 
predictors or on the scale of the response variable from a fitted \pkg{scar} object.
}

\author{
Yining Chen (maintainer) \email{y.chen@statslab.cam.ac.uk}

Richard Samworth \email{r.samworth@statslab.cam.ac.uk}
}

\note{
  The authors gratefully acknowledge the assistance of Ming Yuan
  at the University of Wisconsin-Madison for his insights into this problem.
}

\references{
Groeneboom, P., Jongbloed, G. and Wellner, J.A. (2008).
     The Support Reduction Algorithm for Computing Non-Parametric Function 
     Estimates in Mixture Models. Scandinavian Journal of Statistics, 35, 385-399.

Hastie, T. and Tibshirani, R. (1990) Generalized Additive Models. 
     Chapman and Hall, London.

Nocedal, J., and Wright, S. J. (2006) Numerical Optimization, 2nd edition. 
     Springer, New York.

Robertson, T., Wright, F. T. and Dykstra, R. L. (1988). 
     Order Restricted Statistical Inference. Wiley, New York.

Venables, W. N. and Ripley, B. D. (2002) Modern Applied
     Statistics with S. Springer, New York.

Wood, S.N. (2004) Stable and efficient multiple smoothing parameter estimation 
     for generalized additive models. Journal of American Statistical Association, 
     99, 673-686.
}

\keyword{ package }
\keyword{ classes }
\keyword{ multivariate }
\keyword{ nonparametric }
\keyword{ optimize }

\seealso{
  \code{\link[Iso:pava]{Iso}},  
  \code{\link[scam:scam-package]{scam}},  
  \code{\link[stats:glm]{glm}}  
}

\examples{
## see examples for the function scar
}
