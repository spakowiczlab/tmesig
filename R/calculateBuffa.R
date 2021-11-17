#' Calculate the Buffa hypoxia score
#'
#' This is a score determine by the ranked expressions of 51 genes associated with hypoxia. The final
#' scores are dependent on the provided sample set, not uniquely calculated for each sample.
#' @param genemat A data frame of expression counts where rows are genes, columns are samples, and the gene symbols are available in a column defined as "Gene".
#' @param buffa.genes A character vector of the genes to use when calculating the score. May need to be altered due to changing gene labels.
#' @return A data frame where a column of samples are reported with a column of calcuated Buffa scores for the set.
#' @export

calculateBuffa <- function(genemat, buffa.genes = inputGenes("Buffa")){
  tmp <- genemat %>%
    dplyr::filter(Gene %in% buffa.genes) %>%
    tidyr::gather(-Gene, key = "sample", value = "counts") %>%
    dplyr::group_by(Gene) %>%
    dplyr::mutate(cut = quantile(counts, .5)) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(score.comp = ifelse(counts > cut, 1, -1)) %>%
    dplyr::group_by(sample) %>%
    dplyr::summarise(buffa.score = sum(score.comp))

  return(tmp)
}
