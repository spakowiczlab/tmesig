\name{SCNweights}
\alias{SCNweights}
\docType{data}
\title{PC1 weights for the small-cell neuroendocrine score}
\format{
A data frame with 18,686 rows and 2 columns:
\describe{
\item{gene}{HUGO gene symbol.}
\item{PC1}{PC1 loading from Balanis et al., Cancer Cell, 2019.}
}
}
\usage{
data(SCNweights)
}
\description{
Gene weights used by \code{\link{calculateSCN}}. Each sample score is the
sum of expression times \code{PC1}. \code{calculateSCN()} loads this object
from the package.
}
\keyword{datasets}
