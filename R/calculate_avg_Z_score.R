#' Calculate Average Z Score
#'Calculates the average z score for any given genes within a gene score
#' @param gene_matrix a data frame where columns are samples and rows are genes. Gene symbols are expected as a column labeled "Gene.Symbol".
#' @param gene_list a group of genes within a certain gene symbol
#'
#' @return A data set with all the genes within the requested gene symbol 
#' group and the average z score for each gene. Check if all the 
#' genes within "gene_list" are present in "gene_matrix". 
#' Function will return true if all genes are present and 
#' return false if there are missing genes and list out missing genes.
#' @export
#'
#' @examples calculate_avg_z_score(gene_matrix = expressions, gene_list = c("RNF43","BMP4","TSPAN8","PPP1R1B","SLC44A4","C9orf152","VWA2","AXIN2","SP5","NKD1","CFTR"))
calculate_avg_z_score <- function(gene_matrix, gene_list){
  gene_missing <- checkGenes(gene_matrix$Gene.Symbol, score = NULL, 
                             expected.genes = gene_list) 
  if(length(gene_missing) > 0){
    mis.genes.short <- paste(gene_missing, collapse = ",")
    warn.message <- paste("Genes missing from set:", mis.genes.short)
    print(warn.message)
    
  }
  avg_z_score <- gene_matrix %>%
    pivot_longer(-Gene.Symbol,names_to = "sample", values_to = "counts" )%>%
    group_by(Gene.Symbol)%>%
    mutate(Average = mean(counts), std_dev = sd(counts))%>%
    ungroup()%>%
    mutate(z_score = (counts - Average) / std_dev)%>%
    filter(Gene.Symbol %in% gene_list)%>%
    group_by(sample)%>%
    summarize(avg_z_score = mean(z_score))
  return(avg_z_score)
  
}

```


##Check Genes
```{r}
checkGenes <- function(genevec, score = NULL, expected.genes = NULL){
  
  if(!is.null(score)){
    expected.genes <- inputGenes(score)
  }
  
  missing.genes <- setdiff(expected.genes, genevec)
  
  all.present <- ifelse(length(missing.genes) >= 1, F, T)
  print(all.present)
  
  
  return(missing.genes)
}