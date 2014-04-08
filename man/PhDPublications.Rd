\name{PhDPublications}
\alias{PhDPublications}
\title{Doctoral Publications}

\description{
Data on the scientific productivity of PhD students in biochemistry. 
}

\usage{data("PhDPublications")}

\format{
A data frame containing 915 observations on 6 variables:

\describe{
  \item{articles}{Number of articles published during last 3 years of PhD.}
  \item{gender}{Factor indicating gender.}
  \item{married}{Factor indicating the marital status.}
  \item{kids}{Number of children less than 6 years old.}
  \item{prestige}{Prestige of the graduate program.}
  \item{mentor}{Number of articles published by student's mentor.}
}
}

\source{
Imported directly from CRAN package AER (Kleiber and Zeileis, 2013) for the sake of convenience.
}

\references{
Kleiber, C. and  Zeileis, A. (2013).
\emph{AER: Applied Econometrics with R}.
R package version 1.2-0, http://cran.r-project.org/web/packages/AER/

Long, J.S. (1990).
\emph{Regression Models for Categorical and Limited Dependent Variables}.
Thousand Oaks: Sage Publications.

Long, J.S. (1997). The Origin of Sex Differences in Science.
\emph{Social Forces}, \bold{68}, 1297--1315.
}

\examples{
## Some data pre-processing
data(PhDPublications)
dat = matrix(0,ncol=4,nrow=nrow(PhDPublications))
dat[,1] = as.numeric(PhDPublications$gender == "female")
dat[,2] = as.numeric(PhDPublications$married == "yes")
dat[,3] = as.numeric(PhDPublications$kids)
dat[,4] = as.numeric(PhDPublications$mentor)
y = PhDPublications$articles

## Run scar on the dataset
object = scar(dat,y,shape=c("l","l","de","ccv"),family=poisson())

## Check the effects of mentor
plot(object,which=c(4))
}

\keyword{datasets}
