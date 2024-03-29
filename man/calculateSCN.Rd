% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculateSCN.R
\name{calculateSCN}
\alias{calculateSCN}
\title{Calculate a Small Cell Neuroendocrine phenotype score}
\usage{
calculateSCN(gene_matrix, gene_column)
}
\arguments{
\item{gene_matrix}{A data frame of expression counts where rows are HUGO gene symbols and columns are samples.}

\item{gene_column}{The name of the column in the gene_matrix containing the gene symbols.}
}
\value{
A data frame where samples are reported with their SCN scores.
}
\description{
This score is calculated by summing the weighted expressions of many genes. This method is described
in the paper "Pan-cancer Convergence to a Small-Cell Neuroendocrine Phenotype that Shares Susceptibilities with Hematological Malignancies"
(Balanis et al. Cancer Cell 2019). All genes and weights are available using data(SCNweights).
}
