#' Gene Entries
#' A function that can be used to call of specific gene signatures. This functions is originally intended to be used with the calculateAvgZScore function
#' @param query Name of the signature group. If query is passed "all" function will return all the signature groups
#'
#' @return The genes within a desired signature group
#' @export
#'
#' @examples geneEntries("IFNg_18")
geneEntries <- function(query){
  IFNg_18 <- c("CD3D","IL2RG","NKG7","CIITA","HLA-E","CD3E","CXCR6","CCL5",
               "LAG3","TAGAP","GZMK","CD2", "IDO1","CXCL10","HLA-DRA","STAT1",
               "CXCL13","GZMB")
  WNT <- c("RNF43","BMP4","TSPAN8","PPP1R1B","SLC44A4","C9orf152","VWA2",
           "AXIN2","SP5","NKD1","CFTR","LGR5","ODAM")
  Adenosine <- c("CYTH2", "SLC9A3R2", "ACTN4","ACTN2", "SHH", "NECAB2", "VAMP2",
                 "USP4", "TSNAX", "EPB41", "SNAP23", "ACTN3","ADORA1", "ADORA2B",
                 "ADK", "ADORA2A", "ADA", "HSPA8", "ACTN1","TIPARP", "NT5E", "CAV1",
                 "ADORA3", "ENTPD1", "CD38")
  Angiogenesis <- c("VEGFA","CD34","ANGPTL4","KDR","TEK","NDUFA4L2","ANGPT2","ESM1",
                    "CXCR7","SEMA5B","FLT1","TIE1","CDH6","DLL4","FLT4","ENPEP")
  Auslander <- c("CD86", "CD40", "PD-1", "OX40L", "CD28", "PDL-1", "CD80",
                 "VISTA", "TIM-3", "HVEM", "CTLA4", "CD276", "CD27", "CD200",
                 "CD137L")
  Chaurio <- c("CD3E", "CD8A", "IFNG", "PRF1", "CXCL13", "IGHA1", "IGHG1")
  Chemokine <- c("CCL2","CCL3","CCL4","CCL5","CCL8","CCL18","CCL19","CCL21","CXCL9",
                 "CXCL10","CXCL11","CXCL13")
  Cytotoxic <- c("CD247", "CD2", "CD3E", "GZMH", "NKG7", "PRF1", "GZMK")
  Effector_T_Cell <- c("GZMA","GZMB","PRF1","IFNG","EOMES", "CD8A")
  Glycolysis <- c("ENO1","GSTP1","LDHA","TPI1","ERO1L","PGK1","PFKP","SLC2A1",
                  "CEP55","TEAD4","ADM","BAK1","PLAUR","TUBA1C","CDC20","IL8",
                  "MTHFD1L","S100A9","PDK1","CDCP1","SLC16A3","EPHA2","PLK1",
                  "CA9","CDCA2","FOSL1","ARNTL2","ORC1","GAPDH","B3GNT4")
  gMDSC <- c("SERPINB1","SOD2","S100A8","CTSC","CCL18","CXCL2","PLAUR","NCF2",
             "FPR1","IL8","S100A9","TNFAIP3","CXCL1","BCL2A1","EMR2","LILRB3","SLC11A1",
             "IL6","TREM1","CCL20","LYN","CXCL3","IL1B","IL1R2","AQP9","IL2RA","GPR97",
             "OSM","CXCR1","FPR2","C19orf59","CXCR2","CXCL6","CXCL5","EMR3","MEFV",
             "S100A12","CD300E","FCGR3B","PPBP","LILRA5","LILRA3","CASP5")
  Huang_NRS <- c("CLEC5A", "TNFSF8", "LILRB2", "FCGR2A", "CLECL7A", "CD86", "CD14",
                 "LAIR1", "ITGAM", "FCGR3A", "LILRB4", "CD33", "CCR1", "SIGLEC9",
                 "MARCO", "CD163", "EMILIN2", "CCL8", "CCL2", "HOPX", "EFEMP1",
                 "FN1", "SERPING1", "SULF1", "KLRC2", "GZMB", "IL2RA", "TNFSF10",
                 "SERPINA1", "PSTPIP2", "GZMH", "SLAMF8", "HCLS1", "PDCD1LG2",
                 "TNFAIP8L2", "GZMA", "CCL5", "NKG7", "CCR5", "CLEC12A", "CST7",
                 "CXCL10", "GBP1", "LILRB1", "HCST", "PRF1", "LAG3", "IFNG", "TNFSF14",
                 "CXCL13", "SIGLEC10", "IL32", "CXCL9", "VCAM1", "CASP10", "CD38", "CCR2",
                 "THY1", "FAP", "CDH11", "RARRES2", "COL1A1", "COL3A1", "COL1A2", "MMP1",
                 "IL27", "CLEC4E", "TNFSF18")
  Hypoxia <- c("ENO1","LDHA","TPI1","DDIT4","ERO1L","P4HA1","P4HA2","PGK1","PFKP",
               "SLC2A1","ADM","UPP1","ANGPTL4","NDRG1","PDK1","SLC16A3","EGLN3","CA9",
               "FOSL1","TGFA")
  IFNg_6 <- c("IDO1","CXCL10","CXCL9","HLA-DRA","IFNG","STAT1")
  IFNg_Effector_T_Cells <- c("CD8A", "GZMA", "GZMB", "IFNG", "EOMES", "CXCL9",
                             "CXCL10", "TBX21")
  Ipi_neoadjuvant <- c("CCL2", "CCL3", "CCL4", "CCL5", "CD8A", "CXCL10", "CXCL11", "CXCL9",
                       "IDO", "PRF1", "GZMB", "HLA-DMA", "HLA-DOA", "CD79B", "IGH", "IGKC",
                       "IGLC1", "HLA-DQA1", "IGHM", "CD79A", "IGHD", "CD3G", "CD3D", "HLA-DPA1",
                       "LAT", "VAV1", "INPP5D", "IL2RB", "IGHG1", "CIITA", "IL21R", "STAT1")
  MHC_I <- c("HLA-A", "HLA-B", "HLA-C", "B2M", "TAP1", "TAP2")
  MHC_II <- c("HLA-DMA", "HLA-DMB", "HLA-DOA", "HLA-DOB", "HLA-DPA1", "HLA-DPB1", "HLA-DQA1",
              "HLA-DQA2", "HLA-DQB1", "HLA-DQB2", "HLA-DRA", "HLA-DRB1", "HLA-DRB5")
  mMDSC <- c("CD74","CTSB","FCER1G","HLA-DRA","IFI30","HLA-DMB","C1QC","CD53","APOC1",
             "CD14","FCGR2A","HLA-DMA","LAPTM5","SRGN","TYROBP","ALOX5AP","C1QB",
             "HCLS1","ITGAX","ITGB2","RNASE6","LST1","GMFG","LILRB4","C3AR1","C5AR1",
             "FCGR1A","ICAM1","LY96","MS4A6A","CD52","LILRB2","SASH3","C1orf162","CTSS",
             "C1QA","IL10RA","MPEG1","CCL4","GIMAP4","FCGR3A","LSP1","SIGLEC1","SLC15A3",
             "VSIG4","ARHGAP9","CD4","CORO1A","GPSM3","LY86","MS4A7","PILRA","PLEKHO2",
             "SLCO2B1","ARRB2","IL18BP","CD48","CD68","EVI2A","FGD2","LAIR1","SLC7A7",
             "AOAH","CD163","CD300A","HCST","NCF2","RASSF4","TREM2","CD37","FPR1","HAVCR2",
             "HMOX1","ITGAL","MS4A4A","AMICA1","SLAMF8","TLR2","FPR3","CST7","EVI2B","FERMT3",
             "LAT2","SAMSN1","ABI3","HCK","CYTH4","FGR","SIGLEC10","LCP2","SIGLEC14","CLEC4A",
             "LILRB1","CD180","MNDA","BCL2A1","CCR1","EMR2","FOLR2","IGSF6","VAV1","BIN2",
             "FMNL1","HVCN1","LILRB3","WAS","ADAP2","DOCK2","CSF1R","GPR65","NPL","RASAL3",
             "TLR1","CYBB","FCGR2B","SPI1","APBB1IP","NCKAP1L", "SLC11A1","CD86","ITGAM",
             "PTAFR","SLA","CD300LF","CD33","NCF1","DOK2","DPEP2","OSCAR","CLEC7A","CSF2RA",
             "NCF1B","SP140","DOK3","FLVCR2","FYB","PTPN7","IL16","LILRA2","PLEK","TFEC","NCF1C",
             "NLRC4","SIGLEC7","WIPF1","HLA-DOA","NFAM1","ADORA3","CIITA","MARCO","PRAM1","SELPLG",
             "SPN","PIK3R5","CSF2RB","IL2RA","NLRP3","GAB3","IKZF1","MFNG","MYO1F","TLR7","AIF1",
             "KLHL6","PIK3AP1","LRRC25","STX11","C19orf38","FCN1","GPR84","LILRA6","RCSD1",
             "TRPV2","CD300C","IL21R","TAGAP","BTK","CRTAM","PIK3CG","CD72","GNGT2","RNASE2",
             "SIGLEC5","SIGLEC9","PTPRC","CD80","DNAJC5B","HK3","IL12RB1","MSR1","CD84",
             "CLEC4E","RASGRP4","TLR8","CD300LB","CSF3R","WDFY4","CLEC12A","CMKLR1","ST8SIA4",
             "CYTIP","HTRA4","PIK3R6","CXorf21","SIRPB1","LILRA5","CCR5","CCR2","TNFSF8")
  MYC <- c("CCT3","CCT7","PA2G4","RRS1","TOMM40","DKC1","NOP56","MRTO4","WDR74","BOP1",
           "NOP16","NOP2","NPM3","PAICS","TBRG4","MRPL12","EXOSC4","XPO5","BYSL",
           "C19orf48","FARSA","CCDC86","BCL2L12","C10orf2","IPO4","PUS1","RPP40",
           "TOP1MT","RRP9","RANBP1","CDC25A","WDR4")
  Ock_Immune_Sig_Score <- c("ACSL3","AP2B1","APOL6","ARHGAP15","ARHGAP9","ARHGDIB",
                            "ATP6V0E2-AS1","B2M","BTN3A1","BTN3A3","CCL5","CD8A","CD8B",
                            "CEP72","CGREF1","CXCL10","CXCL2","CXCL3","CXCL9","CYTIP",
                            "DNAL1","EPSTI1","FAM134B","FAM26F","FAM65B","FAM92A1",
                            "FANCI","GBP1P1","GBP4","GBP5","GLRB","GPR171","GPSM1","HCP5",
                            "HILS1","HLA-A","HLA-B","HLA-C","HLA-DMA","HLA-DRA","HLA-DRB6",
                            "HLA-E","HLA-F","HLA-G","HLA-J","HOMER1","ICOS","IKZF3","IL23A",
                            "IL2RG","INPP5D","IRF1","ITGAL","JAK2","JAM3","KIAA1549","KLRD1",
                            "LCK","LCP1","LOC100507463","LOC286109","LOC642852","LONRF2",
                            "MAP1B","MAPK10","MSI2","NFKBIA","NR2F6","PASK","PGPEP1","PLEKHA4",
                            "POP1","PRF1","PRKCQ","PSMB10","PSMB8","PTCHD3P1","PTENP1","PTGER4",
                            "RARRES3","S100A16","SLAMF6","SLAMF7","SLC26A2","SLITRK6","SPATA9",
                            "SPOCK2","SRXN1","STAT1","STAT4","TAP2","TBX21","TMEM56","TNFAIP3",
                            "TNFRSF9","TOX","TRBC1","TRIB3","TXNIP","UBD","UBE2L6","USP9Y",
                            "UTY","YME1L1","ZBTB8A")
  Pan <- c("BLM","CDK12","ERCC2","EXO1","FANCA","FANCM","KNTC1","MDC1","MLH3",
           "MSH2","MSH3","PALB2","POLD1","POLE","PRKDC","RAD50","SHPRH","TOPBP1")
  Proliferation <- c("H2AFZ","HMGB2","HMGA1","MCM7","PCNA","UBE2C","NCAPD2","RFC4",
                     "SNRPD1","NUSAP1","CKS2","PTTG1","KNTC1","KPNA2","ACTL6A","DKC1",
                     "KIAA0101","UBE2T","FEN1","SMC4","CEP55","DNMT1","MCM2","CENPW",
                     "FOXM1","LMNB1","CKS1B","NUP37","RACGAP1","RAN","RNASEH2A","CDK2",
                     "SPAG5","STMN1","TIMELESS","CCNE1","MAD2L1","STIL","UHRF1","TPX2",
                     "CDCA5","KIF11","NUDT1","FANCI","ANLN","CENPA","PRC1","TACC3",
                     "TOPBP1","MCM6","SKA1","ZWINT","GINS3","E2F2","NDC80","TRIP13",
                     "AURKB","CDC20","ECT2","CDC7","KIFC1","POLR2D","BCL2L12","CCNB2",
                     "CDCA3","HMMR","CDCA4","CDKN3","PSRC1","RFC2","CDCA8","GINS2","POLE2",
                     "CCNF","CDC6","MCM5","MND1","RFC5","TK1","RFWD3","DSN1","KIF20A","PRIM1",
                     "TMPO","VRK1","ASF1B","HJURP","KIF4A","MCM4","TOP2A","AURKA","CDK1",
                     "CENPO","ORC6","RRM2","CCNB1","CDC45","NEK2","ASPM","BUB1B","CENPF",
                     "FBXO5","NCAPG","CHAF1A","E2F7","HAUS8","LMNB2","MELK","RANBP1","DSCC1",
                     "MASTL","MKI67","SMC2","CCNA2","EZH2","MLF1IP","PLK1","POLA2","SPC25",
                     "ATAD2","CHAF1B","CKAP2","MCM8","PIF1","RFC3","TTF2","CDCA7","CENPH",
                     "FAM111B","MCM3","MYBL2","RECQL4","E2F1","RAD51AP1","CCNE2","DTL","EXO1",
                     "KIF2C","PBK","RAD54L","TTK","BRCA1","HELLS","NCAPG2","RAD51","ESPL1",
                     "KIF23","NUF2","POLD1","BUB1","FAM64A","POC1A","CDT1","CENPM","ESCO2",
                     "GINS4","WDR62","BLM","CDC25A","CENPE","TCF19","CDCA2","FANCD2","SKA3",
                     "TRAIP","CHEK1","CKAP2L","OIP5","LIN9","PRR11","CENPN","EME1","KIF18B",
                     "KIF20B","CDC25C","DBF4","C16orf59","NEIL3","ATAD5","CENPL","ORC1",
                     "KIF18A","SGOL2","SHCBP1","CENPI","H2AFX","PLK4","TONSL","IQGAP3",
                     "TROAP","C11orf82","CENPK","CHEK2","KIF15","MMS22L","SKP2","BIRC5",
                     "MCM10","ZNF367","ZWILCH","C17orf53","KIAA1524","SGOL1","DLGAP5","DNA2",
                     "FANCA","SPC24","KIF14","POLQ","WDR76","FAM83D","WDHD1","XRCC2","DEPDC1",
                     "ERCC6L","RDM1","DIAPH3","NCAPH","CLSPN","GSG2","E2F8","FANCB","GTSE1",
                     "DEPDC1B","BRIP1","ARHGAP11A","LOC100288637")
  Ras <- c("LGALS3","DUSP6","S100A6","PHLDA1","SPRY4","SPRY2","EPHA2","CD97","ETV4","FOSL1",
           "SLCO4A1")
  Roh_Immune_Score <- c("GZMA","GZMB","PRF1", "GNLY", "HLA-A","HLA-B","HLA-C","HLA-E",
                        "HLA-F","HLA-G","HLA-H","HLA-DMA","HLA-DMB","HLA-DOA","HLA-DOB",
                        "HLA-DPA1","HLA-DPB1","HLA-DQA1","HLA-DQA2","HLA-DQB1","HLA-DRA",
                        "HLA-DRB1", "IFNG","IFNGR1","IFNGR2","IRF1","STAT1", "PSMB9",
                        "CCR5","CCL3","CCL4","CCL5","CXCL9","CXCL10", "CXCL11", "ICAM1",
                        "ICAM2","ICAM3","ICAM4","ICAM5", "VCAM1")
  Rooney_Immune_Cytolytic <- c("GZMA", "PRF1")
  Stroma <- c("AEBP1","COL1A2","CRISPLD2","SPARC","COL3A1","COL5A1","VCAN","COL15A1",
              "MMP2","PDGFRB","PCOLCE","OLFML2B","COL6A3","THY1","FSTL1","GPR124","EDNRA",
              "MXRA8","THBS2","AXL","COL5A2","NID2","COL8A1","DCN","GGT5","ANGPTL2",
              "CD248","LAMA4","GLT8D2","FBN1","ELTD1","CCDC80","CD93","RUNX1T1","LRRC32",
              "MSRB3","HEG1","COL6A2","HSPA12B","OLFML1","TSHZ3","ANTXR1","FILIP1L",
              "KIAA1462","ITGA11","WISP1","CDH11","ECM2","FAM26E","PODN","ADAMTS2")
  TIP_Hot <- c("CXCL9","CXCL10","CXCL11", "CXCR3","CD3","CD4","CD8a","CD8b","CD274",
               "PDCD1","CXCR4","CCL5")
  TLS <- c("CD79B", "CD1D", "CCR6", "LAT", "SKAP1", "CETP", "EIF1AY", "RBP5", "PTGDS")
  LKB1_loss <- c("AVPI1", "BAG1", "CPS1", "DUSP4", "FGA", "GLCE", "HAL", "IRS2",
                 "MUC5AC", "PDE4D", "PTP4A1", "RFK", "SIK1", "TACC2", "TESC", "TFF1")
  gene_list <- list(IFNg_18, WNT, Adenosine, Angiogenesis, Auslander, Chaurio, Chemokine, Cytotoxic, Effector_T_Cell, Glycolysis, gMDSC, Huang_NRS, Hypoxia, IFNg_6, IFNg_Effector_T_Cells, Ipi_neoadjuvant, MHC_I, MHC_II, mMDSC, MYC, Ock_Immune_Sig_Score, Pan, Proliferation, Ras, Roh_Immune_Score, Rooney_Immune_Cytolytic, Stroma, TIP_Hot, TLS, LKB1_loss)
  names(gene_list) <- c("IFNg_18", "WNT", "Adenosine", "Angiogenesis", "Auslander", "Chaurio", "Chemokine", "Cytotoxic", "Effector_T_Cell", "Glycolysis", "gMDSC", "Huang_NRS", "Hypoxia", "IFNg_6", "IFNg_Effector_T_Cells", "Ipi_neoadjuvant", "MHC_I", "MHC_II", "mMDSC", "MYC", "Ock_Immune_Sig_Score", "Pan", "Proliferation", "Ras", "Roh_Immune_Score", "Rooney_Immune_Cytolytic", "Stroma", "TIP_Hot", "TLS", "LKB1_loss")

  if(query == "all"){
    return(gene_list)
  }

  genes_queried <- gene_list[[query]]
  return(genes_queried)
}
