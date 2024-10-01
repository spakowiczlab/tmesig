tmesig documentation
================
2022-07-13

## Z Score Calculations

### calculate_avg_z_score

`calculate_avg_z_score` is a function that takes a data frame and
calculates the average z score for all the values in a given data set

``` r
calculateAvgZScore(gene_matrix = expressions, 
                   genes = geneEntries('IFNg_18'))    #c("RNF43","BMP4","TSPAN8","PPP1R1B","SLC44A4","C9orf152","VWA2","AXIN2","SP5","NKD1","CFTR","LGR5","ODAM"))     
```

### geneEntries

`geneEntries` contains genes within vectors which are signatures

``` r
geneEntries("IFNg_18")
```

`calculate_avg_z_score` can be used with `gene_entires` to pull
signatures

``` r
calculateAvgZScore(gene_matrix = Gene_signatures, genes = geneEntries("IFNg_18"))
```

### Table of Signatures

The table below includes each of the signatures along that we have
implemented into the geneEntries function

| Gene Siganture Name | Description | Number of Genes | Genes | Reference | DOI |
|:---|:---|---:|:---|:---|:---|
| Angiogenesis | This signature is constructed from genes which are highly coexpressed in the angiogenesis pathway. | 16 | VEGFA,CD34,ANGPTL4,KDR,TEK,NDUFA4L2,ANGPT2,ESM1,CXCR7,SEMA5B,FLT1,TIE1,CDH6,DLL4,FLT4,ENPEP | Cristescu et al, Clin Cancer Res., 2022 | <https://doi.org/10.1158/1078-0432.CCR-21-3336> |
| Auslander - Impres | IMPRES score based on logical comparison of quantile-normalized expression of pre-defined checkpoint gene pairs. | 15 | CD86, CD40, PD-1, OX40L, CD28, PDL-1, CD80, VISTA, TIM-3, HVEM, CTLA4, CD276, CD27, CD200, CD137L | Auslander et al, Nat. Med., 2018 | <https://doi.org/10.1038/s41591-018-0157-9> |
| Chaurio | A set of genes that reflect T and B cell responses in human cancer. CXCL13 is the crucial marker | 7 | CD3E, CD8A, IFNG, PRF1, CXCL13, IGHA1, IGHG1 | Chaurio et al, Immunity 2022 | <https://doi.org/10.1016/j.immuni.2021.12.007> |
| Chemokine | Chemokine gene set | 12 | CCL2,CCL3,CCL4,CCL5,CCL8,CCL18,CCL19,CCL21,CXCL9,CXCL10,CXCL11,CXCL13 | Coppola et al (2011), Messina et al (2012) | <doi:10.1016/j.ajpath.2011.03.007>, <doi:10.1038/srep00765> |
| Davoli Cytotoxic Immune Signature | A signature based on scoring the immune infiltration based on gene expression profile. | 7 | CD247, CD2, CD3E, GZMH, NKG7, PRF1, GZMK | Davoli et al, Science, 2017 | <https://doi.org/10.1126/science.aaf8399> |
| Effector T-cell | Effector T cell gene set | 6 | GZMA,GZMB,PRF1,IFNG,EOMES, CD8A | Bolen et al (2011) | <doi:10.1182/bloodadvances.2016000786> |
| Glycolysis | This signature is related to the expression of glucose transpoters and genes related to the metabolism of glucose. | 30 | ENO1,GSTP1,LDHA,TPI1,ERO1L,PGK1,PFKP,SLC2A1,CEP55,TEAD4,ADM,BAK1,PLAUR,TUBA1C,CDC20,IL8,MTHFD1L,S100A9,PDK1,CDCP1,SLC16A3,EPHA2,PLK1,CA9,CDCA2,FOSL1,ARNTL2,ORC1,GAPDH,B3GNT4 | Cristescu et al, Clin Cancer Res., 2022 | <https://doi.org/10.1158/1078-0432.CCR-21-3335> |
| gMDSC | The granulocytic myeloid-derived supressor cell signature contains markers for neutrophils and chemokines which are ligands for the neutrophils. | 43 | SERPINB1,SOD2,S100A8,CTSC,CCL18,CXCL2,PLAUR,NCF2,FPR1,IL8,S100A9,TNFAIP3,CXCL1,BCL2A1,EMR2,LILRB3,SLC11A1,IL6,TREM1,CCL20,LYN,CXCL3,IL1B,IL1R2,AQP9,IL2RA,GPR97,OSM,CXCR1,FPR2,C19orf59,CXCR2,CXCL6,CXCL5,EMR3,MEFV,S100A12,CD300E,FCGR3B,PPBP,LILRA5,LILRA3,CASP5 | Cristescu et al, Clin Cancer Res., 2022 | <https://doi.org/10.1158/1078-0432.CCR-21-3337> |
| Huang NRS | A signature based on differentially expressed genes between patients with recurrence and no recurrence. | 68 | CLEC5A, TNFSF8, LILRB2, FCGR2A, CLECL7A, CD86, CD14, LAIR1, ITGAM, FCGR3A, LILRB4, CD33, CCR1, SIGLEC9, MARCO, CD163, EMILIN2, CCL8, CCL2, HOPX, EFEMP1, FN1, SERPING1, SULF1, KLRC2, GZMB, IL2RA, TNFSF10, SERPINA1, PSTPIP2, GZMH, SLAMF8, HCLS1, PDCD1LG2, TNFAIP8L2, GZMA, CCL5, NKG7, CCR5, CLEC12A, CST7, CXCL10, GBP1, LILRB1, HCST, PRF1, LAG3, IFNG, TNFSF14, CXCL13, SIGLEC10, IL32, CXCL9, VCAM1, CASP10, CD38, CCR2, THY1, FAP, CDH11, RARRES2, COL1A1, COL3A1, COL1A2, MMP1, IL27, CLEC4E, TNFSF18 | Huang et al, Nat. Med., 2019 | <https://doi.org/10.1038/s41591-019-0357-y> |
| Hypoxia | This signature was developed based on the transcriptional reaponse of various cell types to hypoxia. | 20 | ENO1,LDHA,TPI1,DDIT4,ERO1L,P4HA1,P4HA2,PGK1,PFKP,SLC2A1,ADM,UPP1,ANGPTL4,NDRG1,PDK1,SLC16A3,EGLN3,CA9,FOSL1,TGFA | Cristescu et al, Clin Cancer Res., 2022 | <https://doi.org/10.1158/1078-0432.CCR-21-3334> |
| IFNg expanded immune 18 | 18 gene IFNg immune gene set | 18 | CD3D,IL2RG,NKG7,CIITA,HLA-E,CD3E,CXCR6,CCL5,LAG3,TAGAP,GZMK,CD2, IDO1,CXCL10,HLA-DRA,STAT1,CXCL13,GZMB | Ayers et al (2017) | <doi:10.1172/JCI91190> |
| IFNg-6 | 6 gene IFNg associated gene set | 6 | IDO1,CXCL10,CXCL9,HLA-DRA,IFNG,STAT1 | Ayers et al (2017) | <doi:10.1172/JCI91190> |
| IFNg/Effector T-cell | IFNg and T effector gene set | 8 | CD8A, GZMA, GZMB, IFNG, EOMES, CXCL9, CXCL10, TBX21 | Fehrenbacher et al (2016) | <doi:10.1016/S0140-6736(16)00587-0> |
| Ipi-neoadjuvant | A gene signature that reflects a proinflammatory tumor microenvironment and clinical benefit from neoadjuvant ipilimumab. | 32 | CCL2, CCL3, CCL4, CCL5, CD8A, CXCL10, CXCL11, CXCL9, IDO, PRF1, GZMB, HLA-DMA, HLA-DOA, CD79B, IGH, IGKC, IGLC1, HLA-DQA1, IGHM, CD79A, IGHD, CD3G, CD3D, HLA-DPA1, LAT, VAV1, INPP5D, IL2RB, IGHG1, CIITA, IL21R, STAT1 | Tarhini et al (2017) | <http://dx.doi.org/10.1080/2162402X.2016.1231291> |
| MHC-I | 6 MHC-I genes | 6 | HLA-A, HLA-B, HLA-C, B2M, TAP1, TAP2 | Liu et al (2021) | doi.org/10.1038/s41591-021-01331-8 |
| MHC-II | 13 MHC-II genes | 13 | HLA-DMA, HLA-DMB, HLA-DOA, HLA-DOB, HLA-DPA1, HLA-DPB1, HLA-DQA1, HLA-DQA2, HLA-DQB1, HLA-DQB2, HLA-DRA, HLA-DRB1, HLA-DRB5 | Liu et al (2021) | doi.org/10.1038/s41591-021-01331-8 |
| mMDSC | The monocytic myeloid-derived suppressor cell signature contains markers of the monocytic morphology. | 209 | CD74,CTSB,FCER1G,HLA-DRA,IFI30,HLA-DMB,C1QC,CD53,APOC1,CD14,FCGR2A,HLA-DMA,LAPTM5,SRGN,TYROBP,ALOX5AP,C1QB,HCLS1,ITGAX,ITGB2,RNASE6,LST1,GMFG,LILRB4,C3AR1,C5AR1,FCGR1A,ICAM1,LY96,MS4A6A,CD52,LILRB2,SASH3,C1orf162,CTSS,C1QA,IL10RA,MPEG1,CCL4,GIMAP4,FCGR3A,LSP1,SIGLEC1,SLC15A3,VSIG4,ARHGAP9,CD4,CORO1A,GPSM3,LY86,MS4A7,PILRA,PLEKHO2,SLCO2B1,ARRB2,IL18BP,CD48,CD68,EVI2A,FGD2,LAIR1,SLC7A7,AOAH,CD163,CD300A,HCST,NCF2,RASSF4,TREM2,CD37,FPR1,HAVCR2,HMOX1,ITGAL,MS4A4A,AMICA1,SLAMF8,TLR2,FPR3,CST7,EVI2B,FERMT3,LAT2,SAMSN1,ABI3,HCK,CYTH4,FGR,SIGLEC10,LCP2,SIGLEC14,CLEC4A,LILRB1,CD180,MNDA,BCL2A1,CCR1,EMR2,FOLR2,IGSF6,VAV1,BIN2,FMNL1,HVCN1,LILRB3,WAS,ADAP2,DOCK2,CSF1R,GPR65,NPL,RASAL3,TLR1,CYBB,FCGR2B,SPI1,APBB1IP,NCKAP1L,SLC11A1,CD86,ITGAM,PTAFR,SLA,CD300LF,CD33,NCF1,DOK2,DPEP2,OSCAR,CLEC7A,CSF2RA,NCF1B,SP140,DOK3,FLVCR2,FYB,PTPN7,IL16,LILRA2,PLEK,TFEC,NCF1C,NLRC4,SIGLEC7,WIPF1,HLA-DOA,NFAM1,ADORA3,CIITA,MARCO,PRAM1,SELPLG,SPN,PIK3R5,CSF2RB,IL2RA,NLRP3,GAB3,IKZF1,MFNG,MYO1F,TLR7,AIF1,KLHL6,PIK3AP1,LRRC25,STX11,C19orf38,FCN1,GPR84,LILRA6,RCSD1,TRPV2,CD300C,IL21R,TAGAP,BTK,CRTAM,PIK3CG,CD72,GNGT2,RNASE2,SIGLEC5,SIGLEC9,PTPRC,CD80,DNAJC5B,HK3,IL12RB1,MSR1,CD84,CLEC4E,RASGRP4,TLR8,CD300LB,CSF3R,WDFY4,CLEC12A,CMKLR1,ST8SIA4,CYTIP,HTRA4,PIK3R6,CXorf21,SIRPB1,LILRA5,CCR5,CCR2,TNFSF8 | Cristescu et al, Clin Cancer Res., 2022 | <https://doi.org/10.1158/1078-0432.CCR-21-3338> |
| MYC | The Myc signature is an oncogenic signature focused on MYC pathway activation. | 32 | CCT3,CCT7,PA2G4,RRS1,TOMM40,DKC1,NOP56,MRTO4,WDR74,BOP1,NOP16,NOP2,NPM3,PAICS,TBRG4,MRPL12,EXOSC4,XPO5,BYSL,C19orf48,FARSA,CCDC86,BCL2L12,C10orf2,IPO4,PUS1,RPP40,TOP1MT,RRP9,RANBP1,CDC25A,WDR4 | Cristescu et al, Clin Cancer Res., 2022 | <https://doi.org/10.1158/1078-0432.CCR-21-3332> |
| Ock Immune Signature Score | A gene signature predictor based around Bayesian compound covariate predictor algorithm. Stratifies patients into a responder/non-responder. | 105 | ACSL3,AP2B1,APOL6,ARHGAP15,ARHGAP9,ARHGDIB,ATP6V0E2-AS1,B2M,BTN3A1,BTN3A3,CCL5,CD8A,CD8B,CEP72,CGREF1,CXCL10,CXCL2,CXCL3,CXCL9,CYTIP,DNAL1,EPSTI1,FAM134B,FAM26F,FAM65B,FAM92A1,FANCI,GBP1P1,GBP4,GBP5,GLRB,GPR171,GPSM1,HCP5,HILS1,HLA-A,HLA-B,HLA-C,HLA-DMA,HLA-DRA,HLA-DRB6,HLA-E,HLA-F,HLA-G,HLA-J,HOMER1,ICOS,IKZF3,IL23A,IL2RG,INPP5D,IRF1,ITGAL,JAK2,JAM3,KIAA1549,KLRD1,LCK,LCP1,LOC100507463,LOC286109,LOC642852,LONRF2,MAP1B,MAPK10,MSI2,NFKBIA,NR2F6,PASK,PGPEP1,PLEKHA4,POP1,PRF1,PRKCQ,PSMB10,PSMB8,PTCHD3P1,PTENP1,PTGER4,RARRES3,S100A16,SLAMF6,SLAMF7,SLC26A2,SLITRK6,SPATA9,SPOCK2,SRXN1,STAT1,STAT4,TAP2,TBX21,TMEM56,TNFAIP3,TNFRSF9,TOX,TRBC1,TRIB3,TXNIP,UBD,UBE2L6,USP9Y,UTY,YME1L1,ZBTB8A | Ock et al, Nat. Comm., 2017 | <https://doi.org/10.1038/s41467-017-01018-0> |
| Pan | A gene panel, with 18 genes, developed to predict response to ICI. | 18 | BLM,CDK12,ERCC2,EXO1,FANCA,FANCM,KNTC1,MDC1,MLH3,MSH2,MSH3,PALB2,POLD1,POLE,PRKDC,RAD50,SHPRH,TOPBP1 | Pan et al, Clin and Transl Immunology | <https://doi.org/10.1002/cti2.1145> |
| Proliferation | A marker that emphasizes genes related to the cell cycle and proliferation rates in cell lines. | 227 | H2AFZ,HMGB2,HMGA1,MCM7,PCNA,UBE2C,NCAPD2,RFC4,SNRPD1,NUSAP1,CKS2,PTTG1,KNTC1,KPNA2,ACTL6A,DKC1,KIAA0101,UBE2T,FEN1,SMC4,CEP55,DNMT1,MCM2,CENPW,FOXM1,LMNB1,CKS1B,NUP37,RACGAP1,RAN,RNASEH2A,CDK2,SPAG5,STMN1,TIMELESS,CCNE1,MAD2L1,STIL,UHRF1,TPX2,CDCA5,KIF11,NUDT1,FANCI,ANLN,CENPA,PRC1,TACC3,TOPBP1,MCM6,SKA1,ZWINT,GINS3,E2F2,NDC80,TRIP13,AURKB,CDC20,ECT2,CDC7,KIFC1,POLR2D,BCL2L12,CCNB2,CDCA3,HMMR,CDCA4,CDKN3,PSRC1,RFC2,CDCA8,GINS2,POLE2,CCNF,CDC6,MCM5,MND1,RFC5,TK1,RFWD3,DSN1,KIF20A,PRIM1,TMPO,VRK1,ASF1B,HJURP,KIF4A,MCM4,TOP2A,AURKA,CDK1,CENPO,ORC6,RRM2,CCNB1,CDC45,NEK2,ASPM,BUB1B,CENPF,FBXO5,NCAPG,CHAF1A,E2F7,HAUS8,LMNB2,MELK,RANBP1,DSCC1,MASTL,MKI67,SMC2,CCNA2,EZH2,MLF1IP,PLK1,POLA2,SPC25,ATAD2,CHAF1B,CKAP2,MCM8,PIF1,RFC3,TTF2,CDCA7,CENPH,FAM111B,MCM3,MYBL2,RECQL4,E2F1,RAD51AP1,CCNE2,DTL,EXO1,KIF2C,PBK,RAD54L,TTK,BRCA1,HELLS,NCAPG2,RAD51,ESPL1,KIF23,NUF2,POLD1,BUB1,FAM64A,POC1A,CDT1,CENPM,ESCO2,GINS4,WDR62,BLM,CDC25A,CENPE,TCF19,CDCA2,FANCD2,SKA3,TRAIP,CHEK1,CKAP2L,OIP5,LIN9,PRR11,CENPN,EME1,KIF18B,KIF20B,CDC25C,DBF4,C16orf59,NEIL3,ATAD5,CENPL,ORC1,KIF18A,SGOL2,SHCBP1,CENPI,H2AFX,PLK4,TONSL,IQGAP3,TROAP,C11orf82,CENPK,CHEK2,KIF15,MMS22L,SKP2,BIRC5,MCM10,ZNF367,ZWILCH,C17orf53,KIAA1524,SGOL1,DLGAP5,DNA2,FANCA,SPC24,KIF14,POLQ,WDR76,FAM83D,WDHD1,XRCC2,DEPDC1,ERCC6L,RDM1,DIAPH3,NCAPH,CLSPN,GSG2,E2F8,FANCB,GTSE1,DEPDC1B,BRIP1,ARHGAP11A,LOC100288637 | Cristescu et al, Clin Cancer Res., 2022 | <https://doi.org/10.1158/1078-0432.CCR-21-3329> |
| Ras | The Ras signature focuses on prediction of the response against PI3K and RAS inhibitors. | 11 | LGALS3,DUSP6,S100A6,PHLDA1,SPRY4,SPRY2,EPHA2,CD97,ETV4,FOSL1,SLCO4A1 | Cristescu et al, Clin Cancer Res., 2022 | <https://doi.org/10.1158/1078-0432.CCR-21-3331> |
| Roh Immune Score | A gene signature that combines cytolytic markers, HLA molecules, IFN-𝛄 pathway genes, chemokines, and adhesions molecules. | 41 | GZMA, GZMB, PRF1, GNLY, HLA-A, HLA-B, HLA-C, HLA-E, HLA-F, HLA-G, HLA-H, HLA-DMA, HLA-DMB, HLA-DOA, HLA-DOB, HLA-DPA1, HLA-DPB1, HLA-DQA1, HLA-DQA2, HLA-DQB1, HLA-DRA, HLA-DRB1, IFNG, IFNGR1, IFNGR2, IRF1, STAT1, PSMB9, CCR5, CCL3, CCL4, CCL5, CXCL9, CXCL10, CXCL11, ICAM1, ICAM2, ICAM3, ICAM4, ICAM5, VCAM1 | Roh et al, Sci. Transl. Med., 2017 | <https://doi.org/10.1126/scitranslmed.aah3560> |
| Rooney Immune Cytolytic Activity | A simple gene signature based around the expression of two key cytolytic effectors. | 2 | GZMA, PRF1 | Rooney et al, Cell, 2015 | <https://doi.org/10.1016/j.cell.2014.12.033> |
| Stroma | This signature is based on the infiltration of stromal cells into the tumor. | 51 | AEBP1,COL1A2,CRISPLD2,SPARC,COL3A1,COL5A1,VCAN,COL15A1,MMP2,PDGFRB,PCOLCE,OLFML2B,COL6A3,THY1,FSTL1,GPR124,EDNRA,MXRA8,THBS2,AXL,COL5A2,NID2,COL8A1,DCN,GGT5,ANGPTL2,CD248,LAMA4,GLT8D2,FBN1,ELTD1,CCDC80,CD93,RUNX1T1,LRRC32,MSRB3,HEG1,COL6A2,HSPA12B,OLFML1,TSHZ3,ANTXR1,FILIP1L,KIAA1462,ITGA11,WISP1,CDH11,ECM2,FAM26E,PODN,ADAMTS2 | Cristescu et al, Clin Cancer Res., 2022 | <https://doi.org/10.1158/1078-0432.CCR-21-3330> |
| TIP Hot | Genes that serve as a marker of ‘hot’ (inflamed) tumors. | 12 | CXCL9,CXCL10,CXCL11, CXCR3,CD3,CD4,CD8a,CD8b,CD274,PDCD1,CXCR4,CCL5 | Wang et al, Sci Advances 2021 | <https://doi.org/10.1126/sciadv.abd7851> |
| TLS | Tertiary lymphoid structures gene signature | 9 | CD79B, CD1D, CCR6, LAT, SKAP1, CETP, EIF1AY, RBP5, PTGDS | Cabrita et al (2020) | doi.org/10.1038/s41586-019-1914-8 |
| WNT | A signature developed to predict WNT mutations within human tumor datasets. | 13 | RNF43,BMP4,TSPAN8,PPP1R1B,SLC44A4,C9orf152,VWA2,AXIN2,SP5,NKD1,CFTR,LGR5,ODAM | Cristescu et al, Clin Cancer Res., 2022 | <https://doi.org/10.1158/1078-0432.CCR-21-3333> |
| LKB1-loss | LKB1 Loss Induces Characteristic Patterns of Gene Expression in Human Tumors Associated with NRF2 Activation and Attenuation of PI3K-AKT | 16 | AVPI1, BAG1, CPS1, DUSP4, FGA, GLCE, HAL, IRS2, MUC5AC, PDE4D, PTP4A1, RFK, SIK1, TACC2, TESC, and TFF1 | Jacob M. Kaufman, Joseph M. Amann, Kyungho Park, Rajeswara Rao Arasada, Haotian Li, Yu Shyr, David P. Carbone | <https://doi.org/10.1097/JTO.0000000000000173> |
| Adenosine | Adenosine related genes | 25 | CYTH2, SLC9A3R2, ACTN4, ACTN2, SHH, NECAB2, VAMP2, USP4, TSNAX, EPB41, SNAP23, ACTN3, ADORA1, ADORA2B, ADK, ADORA2A, ADA, HSPA8, ACTN1,TIPARP, NT5E, CAV1, ADORA3, ENTPD1, CD38 | Augustin RC, Leone RD, |  |
| Naing A, et al. | <doi:10.1136/jitc-2021-004089> |  |  |  |  |
