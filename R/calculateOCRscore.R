#' Calculate the OCR-score
#'
#' The OCR-score is the mean of log2(count + 1) across genes associated with
#' mitochondrial oxygen demand and hypoxia.
#'
#' @param gene_matrix A data frame of expression counts where rows are genes, columns are samples, and the gene symbols are available in a column defined as "Gene".
#' @param ocr.genes A character vector of the genes to use when calculating the score. May need to be altered due to changing gene labels.
#' @return A data frame with a column of samples and a column of their OCR-scores.
#' @importFrom dplyr %>%
#' @export

calculateOCRscore <- function(gene_matrix, ocr.genes = inputGenes("OCRscore")){
  tmp <- gene_matrix %>%
    dplyr::filter(Gene %in% ocr.genes) %>%
    tidyr::gather(-Gene, key = "sample", value = "counts") %>%
    dplyr::mutate(logged.count = log2(counts+1)) %>%
    dplyr::group_by(sample) %>%
    dplyr::summarise(OCRscore = mean(logged.count))

  return(tmp)
}
