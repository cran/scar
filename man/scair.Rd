\name{scair}
\alias{scair}

\title{
Maximizing the likelihood of the generalised additive index model 
with shape constraints
}

\description{
This function searches for a maximum likelihood estimator (mle) of the 
generalised additive index regression with shape constraints. A stochastic search 
strategy is used here. 
  
Each index is a linear combination of some (or all) the covariates. 
Each additive component function of these index predictors is assumed to belong 
to one of the nine possible shape restrictions. 

The output is an object of class \code{scair} which contains all the information 
needed to plot the estimator using the \code{\link[=plot.scair]{plot}} method, or 
to evaluate it using the \code{\link[=predict.scair]{predict}} method.
}

\usage{
scair(x,y,shape=rep("l",1), family=gaussian(), weights=rep(1,length(y)), 
  epsilon=1e-8, delta=0.1, indexgen=c("unif", "norm"), iter = 200, 
  allnonneg = FALSE)
}

\arguments{
\item{x}{Observed covariates in \eqn{R^d}, in the form of an \eqn{n \times d}{n x d} 
         numeric \code{matrix}.}  

\item{y}{Observed responses, in the form of a numeric \code{vector} of length \eqn{n}.}

\item{shape}{A vector that specifies the shape restrictions for additive component function
	 of each index (also called the ridge function), in the form of a string vector of 
         length \eqn{m}{m}. Here for the sake of identifiability, we require the number of 
         indices \eqn{m \le d}{m <= d}. The shape constraints we considered (with their 
         coresponding abbreviations used in \code{shape}) are listed below:

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
          the active set algorithm in \code{scar}.  See \code{\link{scar}} 
          for more details.}

\item{delta}{A tuning parameter used to avoid the perfect fit phenomenon, and to 
	  ensure identifiability. It represents the lower bound of the minimum 
	  eigenvalue of all possible \eqn{A^T A} subject to identiability 
	  conditions, where \eqn{A} is an index matrix. It should be smaller than 1. 
	  This parameter is NOT needed when \eqn{d=1}, or the prediction function is
	  convex or concave, or all the entries of the index matrix are non-negative
          if all ridge functions are increasing or decreasing.}

\item{indexgen}{It determines how the index matrices are generated in the stochastic
	  search. If its value is "\code{unif}", then entries of the index matrices are drawn 
	  from uniform distribution; otherwise, if its value is "\code{norm}", entries are 
	  drawn from normal.}

\item{iter}{Number of iterations of the stochastic search.}

\item{allnonneg}{A boolean variable that specifies whether all the entries of the 
	  index matrices are non-negative. If it is true, then \code{delta} is no
	  longer needed in case the ridge functions are either all increasing, or all 
          decreasing.}
}

\details{
  For \eqn{i = 1,\ldots,n}{i=1,...,n}, let \eqn{X_i}{X_i} be the \eqn{d}{d}-dimensional
  covariates, \eqn{Y_i}{Y_i} be the corresponding one-dimensional response and 
  \eqn{w_i}{w_i} be its weight. The generalised additive index model can be written as 
  \deqn{g(\mu) = f(x),}{g(mu) = f(A^T x),} where \eqn{x=(x_1,\ldots,x_d)^T}{x=(x_1,...,x_d)^T},
  \eqn{g} is a known link function, \eqn{A} is an \eqn{d \times m}{d x m} index matrix,  and 
  \eqn{f} is an additive function. Our task is to estimate both the index matrix and the 
  additive function. 
 
  Assume the canonical link function is used here, then the maximum likelihood estimator 
  of the generalised additive index model based on observations 
  \eqn{(X_1,Y_1), \ldots, (X_n,Y_n)}{(X_1,Y_1), ..., (X_n,Y_n)} 
  is the function that maximises 
  \deqn{\frac{1}{n} \sum_{i=1}^n w_i \{Y_i f(A^T X_i) - B(f(A^T X_i))\}}{[w_1 (Y_1 f(A^T X_1) -B(f(A^T X_1)))
  + ... + w_n (Y_n f(A^T X_n) -B(f(A^T X_n)))]/n} 
  subject to the restrictions that for every \eqn{j = 1,\ldots,m}{j=1,...,m}, 
  the \eqn{j}-th additive component of \eqn{f} satisfies the constraint indicated by the  
  \eqn{j}-th element of \code{shape}. Here \eqn{B(.)} is the log-partition function of 
  the specified exponential family distribution, and \eqn{w_i} are the weights. For i.i.d. data, 
  \eqn{w_i} should be \eqn{1} for each \eqn{i}.
  
  For any given \eqn{A}{A}, the optimization problem can solved using the active set algorithm 
  implemented in \code{scar}. Therefore, this problem can be reduced to a finite-dimensional 
  optimisation problem. Here we apply a simple stochastic search strategy is proposed, though other methods, 
  such as downhill simplex, is also possible (and sometimes offers competitive performance).
  All the implementaton details can be found in \cite{Chen and Samworth (2016)}, where theoretical 
  justification of our estimator (i.e. uniform consistency) is also given.

  For the identifiability of additive index models, we refer to \cite{Yuan (2011)}.
}

\value{An object of class \code{scair}, with the following components:
  \item{x}{Covariates copied from input.}
  \item{y}{Response copied from input.}
  \item{shape}{Shape vector copied from input.}
  \item{weights}{Vector of weights copied from input.}
  \item{family}{The exponential family copied from input.}
  \item{componentfit}{Value of the fitted component function at each observed 
          index (computed using the estimated index matrix), in the form of an 
	  \eqn{n \times m}{n x m} numeric \code{matrix}, where the element at 
          the \eqn{i}-th row and the \eqn{j}-th column is the value of \eqn{f_j} 
          at the \eqn{j}-th coordinate of \eqn{A^T X_i},
          with the identifiability condition satisfied (see details of \code{\link{scar}}).}
  \item{constant}{The estimated value of the constant \eqn{c} in the 
          additive function \eqn{f} (see details of \code{\link{scar}})).}
  \item{deviance}{Up to a constant, minus twice the maximised log-likelihood.
          Where applicable, the constant is chosen to make the saturated
          model to have zero deviance. See also \code{\link[stats:glm]{glm}}.}
  \item{nulldeviance}{The deviance for the null model.}
  \item{delta}{A parameter copied from input.}
  \item{iter}{Total number of iterations of the stochastic search algorithm}
  \item{allnonneg}{specifies whether all entris of the index matrix is non-negative, 
	  copied from input.}
}

\references{
Chen, Y. and Samworth, R. J. (2016).  Generalized additive and index models with shape constraints.
     Journal of the Royal Statistical Society: Series B, 78, 729-754.

Yuan, M. (2011). On the identifiability of additive index models. Statistica Sinica, 21, 1901-1911.

}

\author{Yining Chen and Richard Samworth}

\seealso{
  \code{\link{plot.scair}}, \code{\link{predict.scair}}, \code{\link{scar}}, \code{\link{decathlon}}   
}

\examples{

## An example in the Gaussian additive index regression setting:
## Define the additive function f on the scale of the predictors
f<-function(x){
  return((0.5*x[,1]+0.25*x[,2]-0.25*x[,3])^2) 
}

## Simulate the covariates and the responses
## covariates are drawn uniformly from [-1,1]^3
set.seed(10)
d = 3
n = 500
x = matrix(runif(n*d)*2-1,nrow=n,ncol=d) 
y = f(x) + rnorm(n,sd=0.5)

## Single index model so no delta is required here
shape=c("cvx")
object = scair(x,y,shape=shape, family=gaussian(),iter = 100)

## Estimated index matrix
object$index

## Root squared error for the estimated index
sqrt(sum((object$index - c(0.5,0.25,-0.25))^2))

## Plot the estimatied additive function for the single index
plot(object)

## Evaluate the estimated prediction function at 10^4 random points 
## drawing from the interior of the support
testx = matrix((runif(10000*d)*1.96-0.98),ncol=d)
testf = predict(object,testx)

## and calculate the (estimated) absolute prediction error
mean(abs(testf-f(testx))) 

## Here we can treat the obtained index matrix as a warm start and perform 
## further optimization (on the second and third entry of the index)
## using e.g. the default R optimisation routine.
fn<-function(w){
    dev = Inf
    if (abs(w[1])+abs(w[2])>1) return(dev)
    else {
      wnew = matrix(c(1-abs(w[1])-abs(w[2]),w[1],w[2]),ncol=1)
      dev = scar(x \%*\% wnew, y, shape = "cvx")$deviance
      return (dev)
    } 
}
index23 = optim(object$index[2:3],fn)$par
newindex = matrix(c(1-sum(abs(index23)),index23),ncol=1); newindex

## Root squared error for the new estimated index
sqrt(sum((newindex - c(0.5,0.25,-0.25))^2))

## A further example is provided in decathlon dataset

}

\keyword{ classes }
\keyword{ index }
\keyword{ multivariate }
\keyword{ nonparametric }
\keyword{ optimize }

