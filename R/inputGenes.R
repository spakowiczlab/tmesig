#' Pull gene inputs for various score calculations
#' @param query The name of the score whose associated genes are to be pulled. c("Mitoscore", "Buffa")
#' @return A character vector of the genes symbols associated with the queried score
#' @export

inputGenes <- function(query){
  Mitoscore <- c("ATP5F1B", "ATP5F1C", "ATP5F1D", "ATP5F1E", "ATP5IF1", "ATP5MC1",
                 "ATP5MC2", "ATP5MC3", "ATP5ME", "ATP5MF", "ATP5MG", "ATP5PB",
                 "ATP5PD", "ATP5PF", "ATP5PO", "COX11", "COX15", "COX17", "COX4I1",
                 "COX5A", "COX5B", "COX6A1", "COX6A2", "COX6B1", "COX6C", "COX7A1",
                 "COX7A2", "COX7A2L", "COX7B", "COX7C", "COX8A", "DMAC2L", "MIR4691",
                 "MIR7113", "NDUFA1", "NDUFA10", "NDUFA12", "NDUFA2", "NDUFA3", "NDUFA4",
                 "NDUFA5", "NDUFA6", "NDUFA7", "NDUFA8", "NDUFA9", "NDUFAB1", "NDUFB1",
                 "NDUFB10", "NDUFB2", "NDUFB3", "NDUFB4", "NDUFB5", "NDUFB6", "NDUFB7",
                 "NDUFB8", "NDUFB9", "NDUFC1", "NDUFC2", "NDUFS1", "NDUFS2", "NDUFS3",
                 "NDUFS4", "NDUFS5", "NDUFS6", "NDUFS7", "NDUFS8", "NDUFV1", "NDUFV2",
                 "NDUFV3", "SCO1", "SDHA", "SDHB", "SDHC", "SDHD", "SLC25A14", "SLC25A27",
                 "SLC25A4", "SLC25A5", "SLC25A6", "SNORD138", "SURF1", "UCP1", "UCP2", "UCP3",
                 "UQCR10", "UQCR11", "UQCRB", "UQCRC1", "UQCRC2", "UQCRFS1", "UQCRH", "UQCRQ")
  Buffa <- c("GPI", "UTP11L", "ENO1", "P4HA1", "PFKP", "CA9", "PGAM1", "NP", "HIG2", "C20orf20",
             "AK3L1", "ALDOA", "ADM", "SEC61G", "ACOT7", "PSMA7", "LDHA", "HK2", "NDRG1", "TPI1",
             "SLC2A1", "MRPL15", "SLC25A32", "TUBB6", "DDIT4", "CDKN3", "VEGFA", "MRPS17", "PGK1",
             "BNIP3", "CORO1C", "ANKRD37", "MAP7D1", "MIF", "MCTS1", "MAD2L2", "MRPL13", "SHCBP1",
             "GAPDH", "SLC16A1", "YKT6", "RBM35A", "KIF20A", "TUBA1B", "TUBA1C", "CHCHD2", "ANLN",
             "PSRC1", "KIF4A", "CTSL2", "LRRC42")

  genes.list <- list(Mitoscore, Buffa)
  names(genes.list) <- c("Mitoscore", "Buffa")

  genes.queried <- genes.list[[query]]
  return(genes.queried)

}
