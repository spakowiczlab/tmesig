#' Calculate Average Z Score
#'Calculates the average z score for any given genes within a gene score
#' @param gene_matrix a data frame where columns are Gene Symbols and specific genes
#' @param gene_list a list of genes within a certain gene symbol
#'
#' @return
#' @export
#'
#' @examples
calculate_avg_z_score <- function(gene_matrix, gene_list){
  avg_z_score <- gene_matrix %>%
    pivot_longer(-Gene.Symbol,names_to = "sample", values_to = "counts" )%>%
    group_by(Gene.Symbol)%>%
    mutate(Average = mean(counts), std_dev = sd(counts))%>%
    ungroup()%>%
    mutate(z_score = (counts - Average) / std_dev)%>%
    #test to ensure all genes are in gene list
    #test<-(gene_list) %in% gene_matrix
    #if_else(sum(test) == length(gene_matrix),  "All values are listed", "Not all values are listed")
    filter(Gene.Symbol %in% gene_list)%>%
    group_by(sample)%>%
    summarize(avg_z_score = mean(z_score))
  return(avg_z_score)
  
}