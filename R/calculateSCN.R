#' Calculate a Small Cell Neuroendocrine phenotype score
#'
#' This score is calculated by summing the weighted expressions of many genes. This method is described
#' in the paper "Pan-cancer Convergence to a Small-Cell Neuroendocrine Phenotype that Shares Susceptibilities with Hematological Malignancies"
#' (Balanis et al. Cancer Cell 2019). All genes and weights are available using data(SCNweights).
#' @param gene_matrix A data frame of expression counts where rows are HUGO gene symbols and columns are samples.
#' @param gene_column The name of the column in the gene_matrix containing the gene symbols.
#' @return A data frame where samples are reported with their SCN scores.
#' @export

calculateSCN <- function(gene_matrix, gene_column){
  data("SCNweights")
  tmp <- gene_matrix %>%
    rename("gene" = gene_column) %>%
    tidyr::pivot_longer(-gene, names_to = "sample", values_to = "exp") %>%
    dplyr::inner_join(SCNweights) %>%
    dplyr::mutate(SCN.cont = exp*PC1) %>%
    dplyr::group_by(sample) %>%
    dplyr::summarise(SCN = sum(SCN.cont))

  missing.genes <- setdiff(SCNweights$gene, gene_matrix[[gene_column]])
  warn.message <- paste0("You are missing ", length(missing.genes),
                         " genes, but that might be ok according to the",
                         " authors of this signature (see documentation)")

  print(warn.message)
  return(tmp)
}
