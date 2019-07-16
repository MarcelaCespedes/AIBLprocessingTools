\name{PersonBaseline}
\alias{PersonBaseline}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Creates person, baseline and NumberReps columns on AIBL IDS longitudinal data
}
\description{
To be used when processing and subseting AIBL IDS data sets
}
\usage{
PersonBaseline(ids)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ids}{
AIBL IDS data set with columns AIBL.ID, and preferably Age or Collection. Data set to be in order of Collection points/ Age grouped by AIBL.ID.
}
}
\examples{
ids<- data.frame(AIBL.ID = rep(c(3, 54, 79), each=4), Collection = rep(c(1:4), 3), CSF = runif(12, min = 500, max = 600))

ids<- PersonBaseline(ids)
ids

}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
data.frame
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Marcela Cespedes
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (ids)
{
    no.ppl <- length(unique(ids$AIBL.ID))
    pplc <- 1:no.ppl
    person <- c()
    baseline <- rep(NA, dim(ids)[1])
    reps <- rep(NA, dim(ids)[1])
    counter <- 1
    r.counter = 2
    for (i in 2:dim(ids)[1]) {
        if (ids$AIBL.ID[i] == ids$AIBL.ID[i - 1]) {
            person[i] <- pplc[counter]
            reps[i] <- r.counter
            r.counter = r.counter + 1
        }
        else {
            if (ids$AIBL.ID[i] != ids$AIBL.ID[i - 1]) {
                counter <- counter + 1
                person[i] <- pplc[counter]
                baseline[i] <- 1
                r.counter = 1
                reps[i] <- r.counter
                r.counter = r.counter + 1
            }
        }
    }
    person[1] <- 1
    baseline[1] <- reps[1] <- 1
    ids$person <- person
    ids$NumberReps <- reps
    ids$baseline <- baseline
    return(ids)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
