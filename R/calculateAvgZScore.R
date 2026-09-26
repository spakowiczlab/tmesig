#' Average z-score of a gene signature
#'
#' Standardizes each gene across samples, then returns the mean z-score of the
#' requested genes for each sample. Built-in signatures come from [geneEntries()].
#' Symbols that are absent from `gene_matrix` are reported with `message()` and left out of the mean.
#' @param gene_matrix A data frame with samples in columns and gene symbols in a
#'   column named `Gene.Symbol`.
#' @param genes Character vector of gene symbols to score.
#' @return A data frame with columns `sample` and `avg_z_score`.
#' @importFrom dplyr %>%
#' @export
#'
#' @examples
#' expr <- data.frame(
#'   Gene.Symbol = c("GZMA", "PRF1", "CD8A"),
#'   sample1 = c(10, 5, 8),
#'   sample2 = c(1, 2, 3),
#'   sample3 = c(4, 6, 2)
#' )
#' calculateAvgZScore(expr, genes = c("GZMA", "PRF1"))
calculateAvgZScore <- function(gene_matrix, genes){
  gene_missing <- checkGenes(gene_matrix$Gene.Symbol, score = NULL,
                             expected.genes = genes)
  if(length(gene_missing) > 0){
    mis.genes.short <- paste(gene_missing, collapse = ",")
    warn.message <- paste("Genes missing from set:", mis.genes.short)
    message(warn.message)

  }
  avg_z_score <- gene_matrix %>%
    tidyr::pivot_longer(-Gene.Symbol,names_to = "sample", values_to = "counts" )%>%
    dplyr::group_by(Gene.Symbol)%>%
    dplyr::mutate(Average = mean(counts), std_dev = stats::sd(counts))%>%
    dplyr::ungroup()%>%
    dplyr::mutate(z_score = (counts - Average) / std_dev)%>%
    dplyr::filter(Gene.Symbol %in% genes)%>%
    dplyr::group_by(sample)%>%
    dplyr::summarize(avg_z_score = mean(z_score))
  return(avg_z_score)

}


