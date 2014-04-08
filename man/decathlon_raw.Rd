\name{decathlon_raw}
\alias{decathlon_raw}
\title{Men's decathlon in 2012}

\description{
This dataset consists of men's decathlon results of at least 6500 points in 2012. Only those with athletes scored points in every event are included.
Most men's decathlons are divided into a two-day competition. First day events include 100 metres, long jump, shot put, high jump and 400 metres. Second day events include 110 metres hurdles, discus throw, pole vault, javelin throw and 1500 metres.
}

\usage{data("decathlon_raw")}

\format{
A data frame containing 1075 observations on 15 variables.
\describe{
  \item{Total}{Total (decathlon) score.}
  \item{Name}{First name of the athlete.}
  \item{Surname}{Surname of the athlete.}
  \item{X100m}{Result of 100 metres, in seconds.}
  \item{LJ}{Result of long jump, in metres.}
  \item{SP}{Result of shot put, in metres.}
  \item{HJ}{Result of high jump, in metres.}
  \item{X400m}{Result of 400 metres, in seconds.}
  \item{X110H}{Result of 110 metres hurdles, in seconds.}
  \item{DT}{Result of discus throw, in metres.}
  \item{PV}{Result of polt vault, in metres.}
  \item{JT}{Result of javelin throw, in metres.}
  \item{X1500m}{Result of 1500 metres, in seconds.}
  \item{First.day}{Total points scored in the first day.}
  \item{Second.day}{Total points scored in the second day.}
}
}

\source{
Data compiled from the following sources:

www.decathlon2000.com/

www.iaaf.org/

www.ceskydesetiboj.wz.cz/statistika.html

}

\seealso{\code{\link{decathlon}}}

\keyword{datasets}


