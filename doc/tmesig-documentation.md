# tmesig user manual

2026-09-25

`tmesig` turns a bulk expression matrix into per-sample scores for tumor-microenvironment and tumor-cell programs. Four functions do the scoring. `geneEntries()` holds the gene lists used by the average z-score.

Gene lists in this manual are the vectors `geneEntries()` returns. Rebuild this file from the repository root with `Rscript doc/build-manual.R` after changing a signature.

## Expression matrix

Pass a data frame with genes in rows and samples in columns. One column holds gene symbols. Every other column is a sample.

| Function | Symbol column |
| --- | --- |
| `calculateAvgZScore()` | `Gene.Symbol` |
| `calculateBuffa()`, `calculateOCRscore()` | `Gene` |
| `calculateSCN()` | The column named in `gene_column` |

Symbols are matched as written. Several published sets still use older aliases (`IL8`, `ERO1L`, `GPR124`, `HIG2`, and similar). `checkGenes()` lists symbols that are missing from the matrix.

The Buffa score and the average z-score are relative to the samples in the matrix. Adding or removing samples changes those scores. The OCR-score and the SCN score are computed from each sample's own expression values.

## calculateAvgZScore

Standardizes each gene across samples (mean and standard deviation of that gene), keeps the requested symbols, and returns the mean z-score for each sample.

```r
expr <- data.frame(
  Gene.Symbol = c("GZMA", "PRF1", "CD8A"),
  sample1 = c(10, 5, 8),
  sample2 = c(1, 2, 3),
  sample3 = c(4, 6, 2)
)
calculateAvgZScore(expr, genes = c("GZMA", "PRF1"))
calculateAvgZScore(expr, genes = geneEntries("IFNg_18"))
```

The result has columns `sample` and `avg_z_score`. `checkGenes()` runs first and sends a message of `TRUE` when every requested symbol is present and `FALSE` otherwise. Missing symbols are reported in a second message and left out of the mean. A gene with no variation across samples contributes a missing z-score.

Every set from `geneEntries()` is scored this way, including sets whose original paper used another algorithm. The Auslander genes, for example, are the IMPRES panel stored as a gene list and scored as a mean z-score.

## geneEntries

```r
geneEntries("IFNg_18")
geneEntries("Apoptosis")
names(geneEntries("all"))
```

`geneEntries("all")` returns a named list of 42 signatures. An unknown name returns `NULL`.

## calculateBuffa

Buffa et al. (2010) hypoxia metagene. For each gene in the 51-gene set, a sample contributes `+1` when its expression is above that gene's median in the cohort and `-1` otherwise. The score is the sum of those contributions.

```r
calculateBuffa(expr)
inputGenes("Buffa")
calculateBuffa(expr, buffa.genes = inputGenes("Buffa"))
```

`expr` needs a column named `Gene`. The result has columns `sample` and `buffa.score`. Genes from the signature that are absent in `expr` are left out of the sum. Because the threshold is the cohort median, the score depends on which samples are included.

## calculateOCRscore

Benej et al. OCR-score for oxygen-demand hypoxia. Mean of `log2(count + 1)` across 92 mitochondrial and oxidative-phosphorylation genes (electron-transport chain subunits, ATP synthase, and uncoupling proteins).

```r
calculateOCRscore(expr)
inputGenes("OCRscore")
```

`expr` needs a column named `Gene`. The result has columns `sample` and `OCRscore`. Pass `ocr.genes` to substitute updated symbols. Missing symbols are left out of the mean.

## calculateSCN

Balanis et al. (Cancer Cell, 2019) small-cell neuroendocrine score. Each gene's expression is multiplied by its PC1 weight, and those products are summed within the sample. Expression is used on the scale you supply.

The weights are installed with the package (`gene` and `PC1`, 18,686 genes). `calculateSCN()` loads them from the package. `data(SCNweights)` loads the same object for inspection.

```r
calculateSCN(expr, gene_column = "Gene")
```

`gene_column` is the name of the symbol column. The result has columns `sample` and `SCN`. The function sends a message reporting how many weight genes are absent from the matrix. Balanis and colleagues treat some of that missingness as acceptable.

## checkGenes and inputGenes

`checkGenes()` compares symbols in the matrix with the symbols a score expects. It sends a message of `TRUE` or `FALSE` and returns the missing names.

```r
checkGenes(expr$Gene, score = "Buffa")
checkGenes(expr$Gene, score = "OCRscore")
checkGenes(expr$Gene.Symbol, expected.genes = geneEntries("TLS"))
```

`score` accepts `"Buffa"` or `"OCRscore"` and uses `inputGenes()`. For a z-score signature, pass `expected.genes = geneEntries(...)` and leave `score` as `NULL`. `inputGenes()` itself returns the Buffa or OCR-score character vector.

## Signature catalog

42 signatures are available from `geneEntries()`. Retrieve a list with `geneEntries("<name>")`.

### Immune activity

| Name | Genes | What the set captures | Reference |
| --- | ---: | --- | --- |
| `IFNg_6` | 6 | IFNg-associated genes | Ayers et al. 2017 |
| `IFNg_18` | 18 | Expanded IFNg immune signature | Ayers et al. 2017 |
| `IFNg_Effector_T_Cells` | 8 | IFNg and effector T cells | Fehrenbacher et al. 2016 |
| `Effector_T_Cell` | 6 | Cytotoxic effector T cells | Bolen et al. |
| `Cytotoxic` | 7 | Cytotoxic immune infiltration | Davoli et al. 2017 |
| `Rooney_Immune_Cytolytic` | 2 | Cytolytic activity (GZMA, PRF1) | Rooney et al. 2015 |
| `Roh_Immune_Score` | 41 | Cytolytic effectors, HLA, IFNg, chemokines, and adhesion genes | Roh et al. 2017 |
| `Ock_Immune_Sig_Score` | 105 | Immune signature used to separate checkpoint-blockade responders | Ock et al. 2017 |
| `Auslander` | 15 | Genes from the IMPRES checkpoint-pair panel | Auslander et al. 2018 |
| `Chaurio` | 7 | T and B cell response, including CXCL13 | Chaurio et al. 2022 |
| `Huang_NRS` | 68 | Genes differing between recurrence and no recurrence | Huang et al. 2019 |
| `Ipi_neoadjuvant` | 32 | Proinflammatory microenvironment associated with neoadjuvant ipilimumab benefit | Tarhini et al. 2017 |
| `Pan` | 18 | DNA-repair panel associated with checkpoint-inhibitor response | Pan et al. |
| `TIP_Hot` | 12 | Inflamed (hot) tumors | Wang et al. 2021 |
| `TLS` | 9 | Tertiary lymphoid structures | Cabrita et al. 2020 |
| `Tcell.Senescence` | 4 | T-cell senescence markers |  |
| `Chemokine` | 12 | Chemokine program | Coppola et al. 2011; Messina et al. 2012 |
| `Chemotaxis` | 70 | Leukocyte chemotaxis |  |
| `MHC_I` | 6 | MHC class I antigen presentation | Liu et al. 2021 |
| `MHC_II` | 13 | MHC class II antigen presentation | Liu et al. 2021 |
| `MHC_II_Hsueh` | 9 | MHC class II genes, including CIITA and CD74 |  |

### Myeloid and stromal

| Name | Genes | What the set captures | Reference |
| --- | ---: | --- | --- |
| `gMDSC` | 43 | Granulocytic myeloid-derived suppressor cells | Cristescu et al. 2022 |
| `mMDSC` | 209 | Monocytic myeloid-derived suppressor cells | Cristescu et al. 2022 |
| `Neutrophil_Activation` | 16 | Neutrophil activation |  |
| `NADPH_Oxidase` | 7 | NADPH oxidase complex |  |
| `Phagocytosis` | 38 | Phagocytosis machinery |  |
| `Adenosine` | 25 | Adenosine signaling | Augustin, Leone, Naing et al. |
| `Stroma` | 51 | Stromal infiltration | Cristescu et al. 2022 |
| `Angiogenesis` | 16 | Angiogenesis | Cristescu et al. 2022 |

### Tumor cell state

| Name | Genes | What the set captures | Reference |
| --- | ---: | --- | --- |
| `Hypoxia` | 20 | Transcriptional response to hypoxia | Cristescu et al. 2022 |
| `Glycolysis` | 30 | Glucose transport and glycolysis | Cristescu et al. 2022 |
| `Proliferation` | 227 | Cell-cycle and proliferation genes | Cristescu et al. 2022 |
| `MYC` | 32 | MYC pathway activation | Cristescu et al. 2022 |
| `Ras` | 11 | RAS pathway | Cristescu et al. 2022 |
| `WNT` | 13 | WNT pathway, including genes used to recognize WNT-mutant tumors | Cristescu et al. 2022 |
| `LKB1_loss` | 16 | Expression pattern associated with LKB1 loss | Kaufman et al. 2014 |

### Cell death

| Name | Genes | What the set captures | Reference |
| --- | ---: | --- | --- |
| `Apoptosis` | 12 | Genes upregulated with apoptosis | Kiraz et al. 2016 |
| `Autophagy` | 9 | Genes upregulated with autophagy | Yamamoto et al. 2023 |
| `Ferroptosis` | 3 | Core ferroptosis markers |  |
| `Necroptosis` | 3 | Genes upregulated with necroptosis | Chen et al. 2019 |
| `Pyroptosis` | 8 | Genes upregulated with pyroptosis | Wang et al. 2022 |
| `CellDeath` | 15 | Mixed cell-death genes spanning autophagy, apoptosis, and death receptors |  |

## Genes in each signature

### Immune activity

#### `IFNg_6`

IFNg-associated genes (6 genes). Ayers et al. 2017. [DOI](https://doi.org/10.1172/JCI91190).

IDO1, CXCL10, CXCL9, HLA-DRA, IFNG, STAT1

#### `IFNg_18`

Expanded IFNg immune signature (18 genes). Ayers et al. 2017. [DOI](https://doi.org/10.1172/JCI91190).

CD3D, IL2RG, NKG7, CIITA, HLA-E, CD3E, CXCR6, CCL5, LAG3, TAGAP, GZMK, CD2, IDO1, CXCL10,
HLA-DRA, STAT1, CXCL13, GZMB

#### `IFNg_Effector_T_Cells`

IFNg and effector T cells (8 genes). Fehrenbacher et al. 2016. [DOI](https://doi.org/10.1016/S0140-6736(16)00587-0).

CD8A, GZMA, GZMB, IFNG, EOMES, CXCL9, CXCL10, TBX21

#### `Effector_T_Cell`

Cytotoxic effector T cells (6 genes). Bolen et al. [DOI](https://doi.org/10.1182/bloodadvances.2016000786).

GZMA, GZMB, PRF1, IFNG, EOMES, CD8A

#### `Cytotoxic`

Cytotoxic immune infiltration (7 genes). Davoli et al. 2017. [DOI](https://doi.org/10.1126/science.aaf8399).

CD247, CD2, CD3E, GZMH, NKG7, PRF1, GZMK

#### `Rooney_Immune_Cytolytic`

Cytolytic activity (GZMA, PRF1) (2 genes). Rooney et al. 2015. [DOI](https://doi.org/10.1016/j.cell.2014.12.033).

GZMA, PRF1

#### `Roh_Immune_Score`

Cytolytic effectors, HLA, IFNg, chemokines, and adhesion genes (41 genes). Roh et al. 2017. [DOI](https://doi.org/10.1126/scitranslmed.aah3560).

GZMA, GZMB, PRF1, GNLY, HLA-A, HLA-B, HLA-C, HLA-E, HLA-F, HLA-G, HLA-H, HLA-DMA,
HLA-DMB, HLA-DOA, HLA-DOB, HLA-DPA1, HLA-DPB1, HLA-DQA1, HLA-DQA2, HLA-DQB1, HLA-DRA,
HLA-DRB1, IFNG, IFNGR1, IFNGR2, IRF1, STAT1, PSMB9, CCR5, CCL3, CCL4, CCL5, CXCL9,
CXCL10, CXCL11, ICAM1, ICAM2, ICAM3, ICAM4, ICAM5, VCAM1

#### `Ock_Immune_Sig_Score`

Immune signature used to separate checkpoint-blockade responders (105 genes). Ock et al. 2017. [DOI](https://doi.org/10.1038/s41467-017-01018-0).

ACSL3, AP2B1, APOL6, ARHGAP15, ARHGAP9, ARHGDIB, ATP6V0E2-AS1, B2M, BTN3A1, BTN3A3, CCL5,
CD8A, CD8B, CEP72, CGREF1, CXCL10, CXCL2, CXCL3, CXCL9, CYTIP, DNAL1, EPSTI1, FAM134B,
FAM26F, FAM65B, FAM92A1, FANCI, GBP1P1, GBP4, GBP5, GLRB, GPR171, GPSM1, HCP5, HILS1,
HLA-A, HLA-B, HLA-C, HLA-DMA, HLA-DRA, HLA-DRB6, HLA-E, HLA-F, HLA-G, HLA-J, HOMER1,
ICOS, IKZF3, IL23A, IL2RG, INPP5D, IRF1, ITGAL, JAK2, JAM3, KIAA1549, KLRD1, LCK, LCP1,
LOC100507463, LOC286109, LOC642852, LONRF2, MAP1B, MAPK10, MSI2, NFKBIA, NR2F6, PASK,
PGPEP1, PLEKHA4, POP1, PRF1, PRKCQ, PSMB10, PSMB8, PTCHD3P1, PTENP1, PTGER4, RARRES3,
S100A16, SLAMF6, SLAMF7, SLC26A2, SLITRK6, SPATA9, SPOCK2, SRXN1, STAT1, STAT4, TAP2,
TBX21, TMEM56, TNFAIP3, TNFRSF9, TOX, TRBC1, TRIB3, TXNIP, UBD, UBE2L6, USP9Y, UTY,
YME1L1, ZBTB8A

#### `Auslander`

Genes from the IMPRES checkpoint-pair panel (15 genes). Auslander et al. 2018. [DOI](https://doi.org/10.1038/s41591-018-0157-9).

CD86, CD40, PD-1, OX40L, CD28, PDL-1, CD80, VISTA, TIM-3, HVEM, CTLA4, CD276, CD27,
CD200, CD137L

#### `Chaurio`

T and B cell response, including CXCL13 (7 genes). Chaurio et al. 2022. [DOI](https://doi.org/10.1016/j.immuni.2021.12.007).

CD3E, CD8A, IFNG, PRF1, CXCL13, IGHA1, IGHG1

#### `Huang_NRS`

Genes differing between recurrence and no recurrence (68 genes). Huang et al. 2019. [DOI](https://doi.org/10.1038/s41591-019-0357-y).

CLEC5A, TNFSF8, LILRB2, FCGR2A, CLECL7A, CD86, CD14, LAIR1, ITGAM, FCGR3A, LILRB4, CD33,
CCR1, SIGLEC9, MARCO, CD163, EMILIN2, CCL8, CCL2, HOPX, EFEMP1, FN1, SERPING1, SULF1,
KLRC2, GZMB, IL2RA, TNFSF10, SERPINA1, PSTPIP2, GZMH, SLAMF8, HCLS1, PDCD1LG2, TNFAIP8L2,
GZMA, CCL5, NKG7, CCR5, CLEC12A, CST7, CXCL10, GBP1, LILRB1, HCST, PRF1, LAG3, IFNG,
TNFSF14, CXCL13, SIGLEC10, IL32, CXCL9, VCAM1, CASP10, CD38, CCR2, THY1, FAP, CDH11,
RARRES2, COL1A1, COL3A1, COL1A2, MMP1, IL27, CLEC4E, TNFSF18

#### `Ipi_neoadjuvant`

Proinflammatory microenvironment associated with neoadjuvant ipilimumab benefit (32 genes). Tarhini et al. 2017. [DOI](https://doi.org/10.1080/2162402X.2016.1231291).

CCL2, CCL3, CCL4, CCL5, CD8A, CXCL10, CXCL11, CXCL9, IDO, PRF1, GZMB, HLA-DMA, HLA-DOA,
CD79B, IGH, IGKC, IGLC1, HLA-DQA1, IGHM, CD79A, IGHD, CD3G, CD3D, HLA-DPA1, LAT, VAV1,
INPP5D, IL2RB, IGHG1, CIITA, IL21R, STAT1

#### `Pan`

DNA-repair panel associated with checkpoint-inhibitor response (18 genes). Pan et al. [DOI](https://doi.org/10.1002/cti2.1145).

BLM, CDK12, ERCC2, EXO1, FANCA, FANCM, KNTC1, MDC1, MLH3, MSH2, MSH3, PALB2, POLD1, POLE,
PRKDC, RAD50, SHPRH, TOPBP1

#### `TIP_Hot`

Inflamed (hot) tumors (12 genes). Wang et al. 2021. [DOI](https://doi.org/10.1126/sciadv.abd7851).

CXCL9, CXCL10, CXCL11, CXCR3, CD3, CD4, CD8a, CD8b, CD274, PDCD1, CXCR4, CCL5

#### `TLS`

Tertiary lymphoid structures (9 genes). Cabrita et al. 2020. [DOI](https://doi.org/10.1038/s41586-019-1914-8).

CD79B, CD1D, CCR6, LAT, SKAP1, CETP, EIF1AY, RBP5, PTGDS

#### `Tcell.Senescence`

T-cell senescence markers (4 genes).

p16, ARF, B3GAT1, KLRG1

#### `Chemokine`

Chemokine program (12 genes). Coppola et al. 2011; Messina et al. 2012. [DOI](https://doi.org/10.1016/j.ajpath.2011.03.007).

CCL2, CCL3, CCL4, CCL5, CCL8, CCL18, CCL19, CCL21, CXCL9, CXCL10, CXCL11, CXCL13

#### `Chemotaxis`

Leukocyte chemotaxis (70 genes).

C5AR1, CCL1, CCL11, CCL12, CCL17, CCL19, CCL2, CCL20, CCL21A, CCL21B, CCL21C, CCL22,
CCL24, CCL25, CCL26, CCL3, CCL4, CCL5, CCL6, CCL7, CCL8, CCL9, CKLF, CSF3R, CX3CL1,
CXADR, CXCL1, CXCL10, CXCL13, CXCL15, CXCL2, CXCL3, CXCL5, CXCL9, CXCR1, CXCR2, EDN3,
FCER1G, FCGR3, GBF1, GM2564, IFNG, IL17B, IL1B, IL1F10, IL1RN, ITGA1, ITGA9, ITGAM,
ITGB2, LGALS3, NCKAP1L, PDE4B, PDE4D, PF4, PLA2G1B, PPBP, PREX1, PRKCA, S100A8, S100A9,
SLC37A4, SPP1, SYK, TGFB2, TREM1, TREM3, VAV1, VAV3, XCL1

#### `MHC_I`

MHC class I antigen presentation (6 genes). Liu et al. 2021. [DOI](https://doi.org/10.1038/s41591-021-01331-8).

HLA-A, HLA-B, HLA-C, B2M, TAP1, TAP2

#### `MHC_II`

MHC class II antigen presentation (13 genes). Liu et al. 2021. [DOI](https://doi.org/10.1038/s41591-021-01331-8).

HLA-DMA, HLA-DMB, HLA-DOA, HLA-DOB, HLA-DPA1, HLA-DPB1, HLA-DQA1, HLA-DQA2, HLA-DQB1,
HLA-DQB2, HLA-DRA, HLA-DRB1, HLA-DRB5

#### `MHC_II_Hsueh`

MHC class II genes, including CIITA and CD74 (9 genes).

CIITA, HLA-DRA, CD74, HLA-DMA, HLA-DMB, H2-Eb1, HLA-DOA, HLA-DOB, CREB1

### Myeloid and stromal

#### `gMDSC`

Granulocytic myeloid-derived suppressor cells (43 genes). Cristescu et al. 2022. [DOI](https://doi.org/10.1158/1078-0432.CCR-21-3337).

SERPINB1, SOD2, S100A8, CTSC, CCL18, CXCL2, PLAUR, NCF2, FPR1, IL8, S100A9, TNFAIP3,
CXCL1, BCL2A1, EMR2, LILRB3, SLC11A1, IL6, TREM1, CCL20, LYN, CXCL3, IL1B, IL1R2, AQP9,
IL2RA, GPR97, OSM, CXCR1, FPR2, C19orf59, CXCR2, CXCL6, CXCL5, EMR3, MEFV, S100A12,
CD300E, FCGR3B, PPBP, LILRA5, LILRA3, CASP5

#### `mMDSC`

Monocytic myeloid-derived suppressor cells (209 genes). Cristescu et al. 2022. [DOI](https://doi.org/10.1158/1078-0432.CCR-21-3338).

CD74, CTSB, FCER1G, HLA-DRA, IFI30, HLA-DMB, C1QC, CD53, APOC1, CD14, FCGR2A, HLA-DMA,
LAPTM5, SRGN, TYROBP, ALOX5AP, C1QB, HCLS1, ITGAX, ITGB2, RNASE6, LST1, GMFG, LILRB4,
C3AR1, C5AR1, FCGR1A, ICAM1, LY96, MS4A6A, CD52, LILRB2, SASH3, C1orf162, CTSS, C1QA,
IL10RA, MPEG1, CCL4, GIMAP4, FCGR3A, LSP1, SIGLEC1, SLC15A3, VSIG4, ARHGAP9, CD4, CORO1A,
GPSM3, LY86, MS4A7, PILRA, PLEKHO2, SLCO2B1, ARRB2, IL18BP, CD48, CD68, EVI2A, FGD2,
LAIR1, SLC7A7, AOAH, CD163, CD300A, HCST, NCF2, RASSF4, TREM2, CD37, FPR1, HAVCR2, HMOX1,
ITGAL, MS4A4A, AMICA1, SLAMF8, TLR2, FPR3, CST7, EVI2B, FERMT3, LAT2, SAMSN1, ABI3, HCK,
CYTH4, FGR, SIGLEC10, LCP2, SIGLEC14, CLEC4A, LILRB1, CD180, MNDA, BCL2A1, CCR1, EMR2,
FOLR2, IGSF6, VAV1, BIN2, FMNL1, HVCN1, LILRB3, WAS, ADAP2, DOCK2, CSF1R, GPR65, NPL,
RASAL3, TLR1, CYBB, FCGR2B, SPI1, APBB1IP, NCKAP1L, SLC11A1, CD86, ITGAM, PTAFR, SLA,
CD300LF, CD33, NCF1, DOK2, DPEP2, OSCAR, CLEC7A, CSF2RA, NCF1B, SP140, DOK3, FLVCR2, FYB,
PTPN7, IL16, LILRA2, PLEK, TFEC, NCF1C, NLRC4, SIGLEC7, WIPF1, HLA-DOA, NFAM1, ADORA3,
CIITA, MARCO, PRAM1, SELPLG, SPN, PIK3R5, CSF2RB, IL2RA, NLRP3, GAB3, IKZF1, MFNG, MYO1F,
TLR7, AIF1, KLHL6, PIK3AP1, LRRC25, STX11, C19orf38, FCN1, GPR84, LILRA6, RCSD1, TRPV2,
CD300C, IL21R, TAGAP, BTK, CRTAM, PIK3CG, CD72, GNGT2, RNASE2, SIGLEC5, SIGLEC9, PTPRC,
CD80, DNAJC5B, HK3, IL12RB1, MSR1, CD84, CLEC4E, RASGRP4, TLR8, CD300LB, CSF3R, WDFY4,
CLEC12A, CMKLR1, ST8SIA4, CYTIP, HTRA4, PIK3R6, CXorf21, SIRPB1, LILRA5, CCR5, CCR2,
TNFSF8

#### `Neutrophil_Activation`

Neutrophil activation (16 genes).

ABR, PTAFR, TYROBP, STX11, BCR, SYK, VAMP7, DNASE1, DNASE1L3, FCER1G, PRAM1, ITGB2,
ITGAM, CD177, ANXA3, MYO1F

#### `NADPH_Oxidase`

NADPH oxidase complex (7 genes).

CYBB, CYBA, RAC2, RAC1, NCF2, NCF1, NCF4

#### `Phagocytosis`

Phagocytosis machinery (38 genes).

ABCA1, ADGRB1, AIF1, ARHGAP12, ARHGAP25, BECN1, BIN2, CDC42, CLCN3, ELMO1, FCER1G, FCGR1,
FCGR3, GSN, GULP1, IGLL1, ITGAM, ITGB2, MARCO, MEGF10, MFGE8, MSR1, MYH9, RAC1, RAC3,
RHOBTB1, RHOBTB2, SH3BP1, SIRPA, THBS1, TREM2, TREML4, VAMP7, XKR4, XKR6, XKR7, XKR8,
XKR9

#### `Adenosine`

Adenosine signaling (25 genes). Augustin, Leone, Naing et al. [DOI](https://doi.org/10.1136/jitc-2021-004089).

CYTH2, SLC9A3R2, ACTN4, ACTN2, SHH, NECAB2, VAMP2, USP4, TSNAX, EPB41, SNAP23, ACTN3,
ADORA1, ADORA2B, ADK, ADORA2A, ADA, HSPA8, ACTN1, TIPARP, NT5E, CAV1, ADORA3, ENTPD1,
CD38

#### `Stroma`

Stromal infiltration (51 genes). Cristescu et al. 2022. [DOI](https://doi.org/10.1158/1078-0432.CCR-21-3330).

AEBP1, COL1A2, CRISPLD2, SPARC, COL3A1, COL5A1, VCAN, COL15A1, MMP2, PDGFRB, PCOLCE,
OLFML2B, COL6A3, THY1, FSTL1, GPR124, EDNRA, MXRA8, THBS2, AXL, COL5A2, NID2, COL8A1,
DCN, GGT5, ANGPTL2, CD248, LAMA4, GLT8D2, FBN1, ELTD1, CCDC80, CD93, RUNX1T1, LRRC32,
MSRB3, HEG1, COL6A2, HSPA12B, OLFML1, TSHZ3, ANTXR1, FILIP1L, KIAA1462, ITGA11, WISP1,
CDH11, ECM2, FAM26E, PODN, ADAMTS2

#### `Angiogenesis`

Angiogenesis (16 genes). Cristescu et al. 2022. [DOI](https://doi.org/10.1158/1078-0432.CCR-21-3336).

VEGFA, CD34, ANGPTL4, KDR, TEK, NDUFA4L2, ANGPT2, ESM1, CXCR7, SEMA5B, FLT1, TIE1, CDH6,
DLL4, FLT4, ENPEP

### Tumor cell state

#### `Hypoxia`

Transcriptional response to hypoxia (20 genes). Cristescu et al. 2022. [DOI](https://doi.org/10.1158/1078-0432.CCR-21-3334).

ENO1, LDHA, TPI1, DDIT4, ERO1L, P4HA1, P4HA2, PGK1, PFKP, SLC2A1, ADM, UPP1, ANGPTL4,
NDRG1, PDK1, SLC16A3, EGLN3, CA9, FOSL1, TGFA

#### `Glycolysis`

Glucose transport and glycolysis (30 genes). Cristescu et al. 2022. [DOI](https://doi.org/10.1158/1078-0432.CCR-21-3335).

ENO1, GSTP1, LDHA, TPI1, ERO1L, PGK1, PFKP, SLC2A1, CEP55, TEAD4, ADM, BAK1, PLAUR,
TUBA1C, CDC20, IL8, MTHFD1L, S100A9, PDK1, CDCP1, SLC16A3, EPHA2, PLK1, CA9, CDCA2,
FOSL1, ARNTL2, ORC1, GAPDH, B3GNT4

#### `Proliferation`

Cell-cycle and proliferation genes (227 genes). Cristescu et al. 2022. [DOI](https://doi.org/10.1158/1078-0432.CCR-21-3329).

H2AFZ, HMGB2, HMGA1, MCM7, PCNA, UBE2C, NCAPD2, RFC4, SNRPD1, NUSAP1, CKS2, PTTG1, KNTC1,
KPNA2, ACTL6A, DKC1, KIAA0101, UBE2T, FEN1, SMC4, CEP55, DNMT1, MCM2, CENPW, FOXM1,
LMNB1, CKS1B, NUP37, RACGAP1, RAN, RNASEH2A, CDK2, SPAG5, STMN1, TIMELESS, CCNE1, MAD2L1,
STIL, UHRF1, TPX2, CDCA5, KIF11, NUDT1, FANCI, ANLN, CENPA, PRC1, TACC3, TOPBP1, MCM6,
SKA1, ZWINT, GINS3, E2F2, NDC80, TRIP13, AURKB, CDC20, ECT2, CDC7, KIFC1, POLR2D,
BCL2L12, CCNB2, CDCA3, HMMR, CDCA4, CDKN3, PSRC1, RFC2, CDCA8, GINS2, POLE2, CCNF, CDC6,
MCM5, MND1, RFC5, TK1, RFWD3, DSN1, KIF20A, PRIM1, TMPO, VRK1, ASF1B, HJURP, KIF4A, MCM4,
TOP2A, AURKA, CDK1, CENPO, ORC6, RRM2, CCNB1, CDC45, NEK2, ASPM, BUB1B, CENPF, FBXO5,
NCAPG, CHAF1A, E2F7, HAUS8, LMNB2, MELK, RANBP1, DSCC1, MASTL, MKI67, SMC2, CCNA2, EZH2,
MLF1IP, PLK1, POLA2, SPC25, ATAD2, CHAF1B, CKAP2, MCM8, PIF1, RFC3, TTF2, CDCA7, CENPH,
FAM111B, MCM3, MYBL2, RECQL4, E2F1, RAD51AP1, CCNE2, DTL, EXO1, KIF2C, PBK, RAD54L, TTK,
BRCA1, HELLS, NCAPG2, RAD51, ESPL1, KIF23, NUF2, POLD1, BUB1, FAM64A, POC1A, CDT1, CENPM,
ESCO2, GINS4, WDR62, BLM, CDC25A, CENPE, TCF19, CDCA2, FANCD2, SKA3, TRAIP, CHEK1,
CKAP2L, OIP5, LIN9, PRR11, CENPN, EME1, KIF18B, KIF20B, CDC25C, DBF4, C16orf59, NEIL3,
ATAD5, CENPL, ORC1, KIF18A, SGOL2, SHCBP1, CENPI, H2AFX, PLK4, TONSL, IQGAP3, TROAP,
C11orf82, CENPK, CHEK2, KIF15, MMS22L, SKP2, BIRC5, MCM10, ZNF367, ZWILCH, C17orf53,
KIAA1524, SGOL1, DLGAP5, DNA2, FANCA, SPC24, KIF14, POLQ, WDR76, FAM83D, WDHD1, XRCC2,
DEPDC1, ERCC6L, RDM1, DIAPH3, NCAPH, CLSPN, GSG2, E2F8, FANCB, GTSE1, DEPDC1B, BRIP1,
ARHGAP11A, LOC100288637

#### `MYC`

MYC pathway activation (32 genes). Cristescu et al. 2022. [DOI](https://doi.org/10.1158/1078-0432.CCR-21-3332).

CCT3, CCT7, PA2G4, RRS1, TOMM40, DKC1, NOP56, MRTO4, WDR74, BOP1, NOP16, NOP2, NPM3,
PAICS, TBRG4, MRPL12, EXOSC4, XPO5, BYSL, C19orf48, FARSA, CCDC86, BCL2L12, C10orf2,
IPO4, PUS1, RPP40, TOP1MT, RRP9, RANBP1, CDC25A, WDR4

#### `Ras`

RAS pathway (11 genes). Cristescu et al. 2022. [DOI](https://doi.org/10.1158/1078-0432.CCR-21-3331).

LGALS3, DUSP6, S100A6, PHLDA1, SPRY4, SPRY2, EPHA2, CD97, ETV4, FOSL1, SLCO4A1

#### `WNT`

WNT pathway, including genes used to recognize WNT-mutant tumors (13 genes). Cristescu et al. 2022. [DOI](https://doi.org/10.1158/1078-0432.CCR-21-3333).

RNF43, BMP4, TSPAN8, PPP1R1B, SLC44A4, C9orf152, VWA2, AXIN2, SP5, NKD1, CFTR, LGR5,
ODAM

#### `LKB1_loss`

Expression pattern associated with LKB1 loss (16 genes). Kaufman et al. 2014. [DOI](https://doi.org/10.1097/JTO.0000000000000173).

AVPI1, BAG1, CPS1, DUSP4, FGA, GLCE, HAL, IRS2, MUC5AC, PDE4D, PTP4A1, RFK, SIK1, TACC2,
TESC, TFF1

### Cell death

#### `Apoptosis`

Genes upregulated with apoptosis (12 genes). Kiraz et al. 2016. [DOI](https://doi.org/10.1007/s13277-016-5035-9).

CASP3, CASP7, CASP8, CASP9, BAX, BAK1, BOK, BCL2, BCL2L1, MCL1, APAF1, CYCS

#### `Autophagy`

Genes upregulated with autophagy (9 genes). Yamamoto et al. 2023. [DOI](https://doi.org/10.1038/s41576-022-00562-w).

BECN1, ATG5, ATG7, MAP1LC3B, ULK1, SQSTM1, ATG12, GABARAP, TFEB

#### `Ferroptosis`

Core ferroptosis markers (3 genes).

GPX4, ACSL4, SLC7A11

#### `Necroptosis`

Genes upregulated with necroptosis (3 genes). Chen et al. 2019. [DOI](https://doi.org/10.3390/cells8121486).

RIPK1, RIPK3, MLKL

#### `Pyroptosis`

Genes upregulated with pyroptosis (8 genes). Wang et al. 2022. [DOI](https://doi.org/10.3390/cancers14010237).

AIM2, CASP1, CASP4, CASP5, GSDMD, GSDME, IL1B, NLRP3

#### `CellDeath`

Mixed cell-death genes spanning autophagy, apoptosis, and death receptors (15 genes).

PRKAA2, ATG12, ULK2, ATG5, GABARAPL1, BCL2L1, CASP9, CYCS, IL1A, PIK3CG, TNFRSF10D, FADD,
BIRC3, FAS, DNM1L

## References

1. Buffa, F. M., et al. "Large meta-analysis of multiple cancers reveals a common, compact and highly prognostic hypoxia metagene." *British Journal of Cancer* 102.2 (2010): 428-435.
2. Benej, M., et al. "Oxygen demand driven tumor hypoxia - a new perspective on the genesis and treatment of hypoxia." *Submitted.*
3. Balanis, N. G., et al. "Pan-cancer Convergence to a Small-Cell Neuroendocrine Phenotype that Shares Susceptibilities with Hematological Malignancies." *Cancer Cell* (2019).

Signature-level citations are listed with each gene set above. The chemokine set also draws on Messina et al. 2012 ([DOI](https://doi.org/10.1038/srep00765)).

