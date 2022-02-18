#' Calculate the Mitoscore
#'
#' The mitoscore is a measure of the average expression of the logged counts of a number of genes associated with hypoxia.
#'
#' @param genemat A data frame of expression counts where rows are genes, columns are samples, and the gene symbols are available in a column defined as "Gene".
#' @param mito.genes A character vector of the genes to use when calculating the score. May need to be altered due to changing gene labels.
#' @return A data frame with a column of samples and a column of their associated mitoscores.
#' @export

calculateMitoscore <- function(genemat, mito.genes = inputGenes("Mitoscore")){
  tmp <- genemat %>%
    dplyr::filter(Gene %in% mito.genes) %>%
    tidyr::gather(-Gene, key = "sample", value = "counts") %>%
    dplyr::mutate(logged.count = log2(counts+1)) %>%
    dplyr::group_by(sample) %>%
    dplyr::summarise(MitoScore = mean(logged.count))

  return(tmp)
}
