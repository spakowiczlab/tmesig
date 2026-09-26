#' Calculate a Small Cell Neuroendocrine phenotype score
#'
#' This score is calculated by summing the weighted expressions of many genes. This method is described
#' in the paper "Pan-cancer Convergence to a Small-Cell Neuroendocrine Phenotype that Shares Susceptibilities with Hematological Malignancies"
#' (Balanis et al. Cancer Cell 2019). The PC1 weights ship with the package;
#' `data(SCNweights)` loads them.
#' @param gene_matrix A data frame of expression counts where rows are HUGO gene symbols and columns are samples.
#' @param gene_column The name of the column in the gene_matrix containing the gene symbols.
#' @return A data frame where samples are reported with their SCN scores.
#' @importFrom dplyr %>%
#' @export

calculateSCN <- function(gene_matrix, gene_column){
  utils::data("SCNweights", package = "tmesig", envir = environment())
  missing.genes <- setdiff(SCNweights$gene, gene_matrix[[gene_column]])
  names(gene_matrix)[names(gene_matrix) == gene_column] <- "gene"
  tmp <- gene_matrix %>%
    tidyr::pivot_longer(-gene, names_to = "sample", values_to = "exp") %>%
    dplyr::inner_join(SCNweights, by = "gene") %>%
    dplyr::mutate(SCN.cont = exp * PC1) %>%
    dplyr::group_by(sample) %>%
    dplyr::summarise(SCN = sum(SCN.cont))

  warn.message <- paste0("You are missing ", length(missing.genes),
                         " genes, but that might be ok according to the",
                         " authors of this signature (see documentation)")

  message(warn.message)
  return(tmp)
}
