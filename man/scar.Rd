\name{scar}
\alias{scar}

\title{
Compute the maximum likelihood estimator of the generalised additive regression 
with shape constraints
}

\description{
This function uses the active set algorithm to compute the maximum likelihood 
estimator (mle) of the generalised additive regression with shape constraints. 
Each component function of the additive predictors is assumed to belong 
to one of the nine possible shape restrictions. The estimator's value at the 
data points is unique.

The output is an object of class \code{scar} which contains all the information 
needed to plot the estimator using the \code{\link[=plot.scar]{plot}} method, or 
to evaluate it using the \code{\link[=predict.scar]{predict}} method.
}

\usage{
scar(x, y, shape = rep("l", d), family = gaussian(),
  weights = rep(1, length(y)), epsilon = 1e-08)
}

\arguments{
\item{x}{Observed covariates in \eqn{R^d}, in the form of an \eqn{n \times d}{n x d} 
         numeric \code{matrix}.}

\item{y}{Observed responses, in the form of a numeric \code{vector} of length \eqn{n}.}

\item{shape}{A vector that specifies the shape restrictions for each component function,
         in the form of a string vector of length \eqn{d}{d}. The string allowed and its 
         corresponding shape constraint is listed as follows (see Details):

	 \code{l}:	 linear

	 \code{in}:	 monotonically increasing

	 \code{de}:	 monotonically decreasing

	 \code{cvx}:	 convex

	 \code{cvxin}:	 convex and increasing	

	 \code{cvxde}:	 convex and decreasing	

	 \code{ccv}:	 concave

	 \code{ccvin}:	 concave and increasing	

	 \code{ccvde}:	 concave and decreasing}

\item{family}{A description of the error distribution and link function to
          be used in the model. This can be a character string naming a
          family function, a family function or the result of a call to
          a family function.  Currently only the following five common 
	  exponential families are allowed: Gaussian, Binomial, Poisson,
          and Gamma. By default the canonical link function is used.}

\item{weights}{An optional vector of prior weights to be used when maximising the 
          likelihood. It is a numeric vector of length \eqn{n}{n}. By default 
          equal weights are used.}

\item{epsilon}{Positive convergence tolerance epsilon when performing the 
          iteratively reweighted least squares (IRLS) method at each iteration of 
          the active set algorithm.  See \code{\link[stats:glm.control]{glm.control}} 
          for more details.}
}

\details{
  For \eqn{i = 1,\ldots,n}{i=1,...,n}, let \eqn{X_i}{X_i} be the \eqn{d}{d}-dimensional
  covariates, \eqn{Y_i}{Y_i} be the corresponding one-dimensional response and 
  \eqn{w_i}{w_i} be its weight. The generalised additive model can be written as 
  \deqn{g(\mu) = f(x),}{g(mu) = f(x),} where \eqn{x=(x_1,\ldots,x_d)^T}{x=(x_1,...,x_d)^T},
  \eqn{g} is a known link function and \eqn{f} is an additive function (to be estimated). 
 
  Assume the canonical link function is used here, then the maximum likelihood estimator 
  of the generalised additive model based on observations 
  \eqn{(X_1,Y_1), \ldots, (X_n,Y_n)}{(X_1,Y_1), ..., (X_n,Y_n)} 
  is the function that maximises 
  \deqn{\frac{1}{n} \sum_{i=1}^n w_i \{Y_i f(X_i) - B(f(X_i))\}}{[w_1 (Y_1 f(X_1) -B(f(X_1)))
  + ... + w_n (Y_n f(X_n) -B(f(X_n)))]/n} 
  subject to the restrictions that for every \eqn{j = 1,\ldots,d}{j=1,...,d}, 
  the \eqn{j}-th additive component of \eqn{f} satisfies the constraint indicated by the  
  \eqn{j}-th element of \code{shape}. Here \eqn{B(.)} is the log-partition function of 
  the specified exponential family distribution, and \eqn{w_i} are the weights. For i.i.d. data, 
  \eqn{w_i} should be \eqn{1} for each \eqn{i}.
  
  To make each component of \eqn{f} identifiable, we write
  \deqn{f(x) = \sum_{j=1}^d f_j(x_j) + c}{f(x) = f_1(x_1)  + ... + f_d(x_1) + c}  
  and let \eqn{f_j(0) = 0} for every \eqn{j = 1,\ldots,d}{j=1,...,d}. 
  In case zero is outside the range of the \eqn{j}-th observed covariate, 
  for the sake of convenience, we set \eqn{f_j} to be zero at the sample mean of
  the \eqn{j}-th predictor.
  
  This problem can then be re-written as a concave optimisation problem, and 
  our function uses the active set algorithm to find out the maximum likelihood estimator. 
  A general introduction can be found in \cite{Nocedal and Wright (2006)}. 
  Our algorithm can be viewed as a slight extension of the support 
  reduction procedure proposed by 
  \cite{Groeneboom, Jongbloed and Wellner (2008)}.
}

\value{An object of class \code{scar}, with the following components:
  \item{x}{Covariates copied from input.}
  \item{y}{Response copied from input.}
  \item{shape}{Shape vector copied from input.}
  \item{weights}{The vector of weights copied from input.}
  \item{family}{The exponential family copied from input.}
  \item{componentfit}{Value of the fitted component function at each observed 
          covariate, in the form of an \eqn{n \times d}{n x d} numeric \code{matrix},
          where the element at the \eqn{i}-th row and the \eqn{j}-th column
          is the value of \eqn{f_j} at the \eqn{j}-th coordinate of \eqn{X_i},
          with the identifiability condition satisfied (see Details)}
  \item{constant}{The estimated value of the constant \eqn{c} in the 
          additive function \eqn{f} (see Details).}
  \item{deviance}{Up to a constant, minus twice the maximised log-likelihood.
          Where applicable, the constant is chosen to make the saturated
          model to have zero deviance. See also \code{\link[stats:glm]{glm}}.}
  \item{nulldeviance}{The deviance for the null model.}
  \item{iter}{Total number of iterations of the active set algorithm}.
}

\references{
Groeneboom, P., Jongbloed, G. and Wellner, J.A. (2008).
     The Support Reduction Algorithm for Computing Non-Parametric Function 
     Estimates in Mixture Models. Scandinavian Journal of Statistics, 35, 385-399.

Hastie, T. and Tibshirani, R. (1990). Generalized Additive Models. 
     Chapman and Hall, London.

Meyer, M. C. (2013).  Semi-parametric Additive Constrained Regression.
     Journal of nonparametric statistics, 25, 715-743.

Nocedal, J., and Wright, S. J. (2006). Numerical Optimization, 2nd edition. 
     Springer, New York.

Robertson, T., Wright, F. T. and Dykstra, R. L. (1988). 
     Order Restricted Statistical Inference. Wiley, New York.

Venables, W. N. and Ripley, B. D. (2002). Modern Applied
     Statistics with S. Springer, New York.

Wood, S.N. (2004). Stable and efficient multiple smoothing parameter estimation 
     for generalized additive models. Journal of American Statistical Association, 
     99, 673-686.
}

\author{Yining Chen and Richard Samworth}

\note{
  We acknowledge that \code{\link[stats:glm.fit]{glm.fit}} from the R package 
  \pkg{stats} is called to perform the method of iterated reweighted least squares 
  (IRLS) in our routine. It is possible to speed up the implementation considerably
  by simply suppressing all the run-time checks there. 
  
  If all the component functions are linear, then it is prefered to call directly 
  the function \code{\link[stats:glm]{glm}}.

  For the one-dimensional covariate, see the pool adjacent violators algorithm (PAVA)
  of \cite{Robertson, Wright and Dykstra (1998)} and the support reduction method of 
  \cite{Groeneboom, Jongbloed and Wellner (2008)}. See also the R package 
  \code{\link[Iso:pava]{Iso}}.

  A different approach to tackle this problem is to use splines. See the R package 
  \code{\link[scam:scam-package]{scam}}. We stress here that our approach is free 
  of tuning parameters while \code{\link[scam:scam-package]{scam}} is not, which 
  can be viewed as a major difference.

  To estimate the generalised additive regression function without any shape 
  restrictions, see \cite{Wood (2004)} and \cite{Hastie and Tibshirani (1990)}.
  Their corresponding R implementations are \code{\link[mgcv:mgcv-package]{mgcv}}
  and \code{\link[gam:gam]{gam}}.
}



\seealso{
  \code{\link{plot.scar}}, \code{\link{predict.scar}}, \code{\link{scair}},
  \code{\link[Iso:pava]{Iso}}, 
  \code{\link[scam:scam-package]{scam}},
  \code{\link[mgcv:mgcv-package]{mgcv}},
  \code{\link[gam:gam]{gam}},  
  \code{\link[stats:glm]{glm}}
}

\examples{
## An example in the Poission additive regression setting:
## Define the additive function f on the scale of the predictors
f<-function(x){
  return(1*abs(x[,1]) + 2*(x[,2])^2 + 3*(abs(x[,3]))^3) 
}

## Simulate the covariates and the responses
## covariates are drawn uniformly from [-1,1]^3
set.seed(0)
d = 3
n = 500
x = matrix(runif(n*d)*2-1,nrow=n,ncol=d) 
rpoisson <- function(m){rpois(1,exp(m))}
y = sapply(f(x),rpoisson)

## All the components are convex so one can use scar
shape=c("cvx","cvx","cvx")
object = scar(x,y,shape=shape, family=poisson())

## Plot each component of the estimatied additive function
plot(object)

## Evaluate the estimated additive function at 10^4 random points 
## drawing from the interior of the support
testx = matrix((runif(10000*d)*1.96-0.98),ncol=d)
testf = predict(object,testx)

## and calculate the (estimated) absolute prediction error
mean(abs(testf-f(testx))) 
}

\keyword{ classes }
\keyword{ multivariate }
\keyword{ nonparametric }
\keyword{ optimize }
