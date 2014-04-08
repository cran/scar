\name{decathlon}
\alias{decathlon}
\title{Men's decathlon athletes in 2012}

\description{
This dataset consists of men's decathlon athletes who scored at least 6500 points in at least one athletic competition in 2012 and scored points in every event there. To avoid data dependency, we include only one performance from each athlete, namely their 2012 personal best (over the whole decathlon).
}

\usage{data("decathlon")}

\format{

A data frame containing 614 observations on 10 variables. Different rows represent results of different athletes.

\describe{
  \item{X100m}{Points scored in 100 metres.}
  \item{LJ}{Points scored in long jump.}
  \item{SP}{Points scored in shot put.}
  \item{HJ}{Points scored in high jump.}
  \item{X400m}{Points scored in 400 metres.}
  \item{X110H}{Points scored in 110 metres hurdles.}
  \item{DT}{Points scored in discus throw.}
  \item{PV}{Points scored in polt vault.}
  \item{JT}{Points scored in javelin throw.}
  \item{X1500m}{Points scored in 1500 metres.}
}

The point system (on how to convert results to scores) can be found at 

http://en.wikipedia.org/wiki/Decathlon
}

\source{
Compiled from the dataset \code{\link{decathlon_raw}}.
}


\examples{

data(decathlon)
dat = as.matrix(decathlon[,c("X100m","SP","DT")]); y = decathlon$JT

## We consider the problem of predicting a decathlete's javelin performance 
## from their performances in the other decathlon disciplines.
## As an illustration, we only select 100m, shot put and discus throw
## also, we reduce the number of iterations here to shorten the run time
set.seed(1)
object = scair(dat,y,shape=c("in","in"),iter=40, allnonneg=TRUE)
object$index

## Here we can treat the obtained index matrix as a warm start and perform 
## further optimization using e.g. the default R optimisation routine.
## The result is actually only slightly different from the warm start.
## The optimisation itself takes around 5-10 seconds.
## Code provided but commented out here because CRAN team requires all the 
## examples running here to be completed in a few seconds.
# fn<-function(w){
#  wnew = matrix(0,nrow=3,ncol=2)
#  wnew[1,1] = w[1]
#  wnew[2,1] = w[2]
#  wnew[3,1] = 1 - abs(w[1]) - abs(w[2]) 
#  wnew[1,2] = w[3]
#  wnew[2,2] = w[4]
#  wnew[3,2] = 1 - abs(w[3]) - abs(w[4])
#  if ((wnew[3,1] < 0)|| (wnew[3,2] < 0)) {dev = Inf}
#  else if ((w[1] < 0) || (w[2] < 0) || (w[3] < 0) || (w[4] < 0)) {dev = Inf}
#  else {
#    datnew = dat \%*\% wnew
#    dev = scar(datnew,y,shape=c("in","in"))$deviance
#  }
#  return (dev)
# }
#
# index123 = optim(c(object$index[1:2,1],object$index[1:2,2]),fn)$par
# newindex = matrix(0,nrow=3,ncol=2)
# newindex[1:2,1] = index123[1:2]; newindex[1:2,2] = index123[3:4]
# newindex[3,1] = 1 - sum(abs(index123[1:2]))
# newindex[3,2] = 1 - sum(abs(index123[3:4]))
# newindex

}

\keyword{datasets}
