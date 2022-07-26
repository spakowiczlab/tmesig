#' Check presence of required genes
#'
#' Genes may appear to be missing from the data set due to changing naming conventions. This function returns gene names that are required for the specified calculation
#' so that they can be addressed, possibly by adding updated gene names to the vector before passing to the score calculator.
#' @param genevec A character vector containing the genes available in the data set the calculation is to be performed on.
#' @param score The name of the score whose dependent genes should be checked.
#' @param expected.genes A vector of the genes expected in the data. Can be provided instead of score.
#' @return A character vector containing any genes required by the score and missing in the data set.
#' @export


checkGenes <- function(genes, score = NULL, expected.genes = NULL){

  if(!is.null(score)){
    expected.genes <- inputGenes(score)
  }

  missing.genes <- setdiff(expected.genes, genes)

  all.present <- ifelse(length(missing.genes) >= 1, F, T)
  print(all.present)

  return(missing.genes)
}
