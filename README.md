# tmesig <img src="man/figures/hex-sticker.png" align="right" width="200" alt="tmesig hex sticker" />

## Tumor Micro-Environment Expression SIGnatures

[![DOI](https://zenodo.org/badge/424702817.svg)](https://zenodo.org/badge/latestdoi/424702817)

`tmesig` calculates tumor-microenvironment and tumor-cell expression signature scores from a bulk gene-expression matrix. It provides published gene sets and scoring methods for immune activity, myeloid and stromal biology, hypoxia, an OCR-score of mitochondrial oxygen demand, and small-cell neuroendocrine phenotype.

| Function | Score | What it summarizes |
| --- | --- | --- |
| `calculateAvgZScore()` | Mean z-score | Any gene list, including the 42 sets from `geneEntries()` |
| `calculateBuffa()` | Buffa hypoxia score | 51-gene hypoxia metagene (Buffa et al. 2010) |
| `calculateOCRscore()` | OCR-score | 92 mitochondrial and oxidative-phosphorylation genes (Benej et al.) |
| `calculateSCN()` | Small-cell neuroendocrine score | Expression weighted by Balanis et al. (2019) PC1 loadings |

`checkGenes()` and `inputGenes()` report the symbols each score expects, which matters when gene aliases have changed since the original paper.

## Installation

Requires R 3.5.0 or newer.

```r
install.packages("devtools")
devtools::install_github("spakowiczlab/tmesig")
```

## Expression matrix

Pass a data frame with genes in rows and samples in columns. Gene symbols sit in one column; every other column is a sample.

The symbol column name depends on the function:

| Function | Symbol column |
| --- | --- |
| `calculateAvgZScore()` | `Gene.Symbol` |
| `calculateBuffa()`, `calculateOCRscore()` | `Gene` |
| `calculateSCN()` | The column you name in `gene_column` |

Symbols are matched as written. Several published sets still use older aliases (`IL8`, `ERO1L`, `GPR124`, `HIG2`, and similar). Run `checkGenes()` first when a score looks like it is missing part of its gene set.

The Buffa score and the average z-score are relative to the samples in the matrix you pass in. Adding or removing samples changes those scores. The OCR-score and the SCN score are computed from each sample's own expression values.

## Average z-score

`calculateAvgZScore()` standardizes each gene across samples, keeps the genes in the requested set, and returns the mean z-score for each sample. Use it with a built-in signature or with any character vector of symbols.

```r
calculateAvgZScore(expr, genes = geneEntries("IFNg_18"))

calculateAvgZScore(expr, genes = c("GZMA", "PRF1"))

# score every built-in set
lapply(geneEntries("all"), function(genes) calculateAvgZScore(expr, genes))
```

The result is a data frame with `sample` and `avg_z_score`. If any requested symbol is absent, the function sends a message listing those symbols and averages the genes that are present. A gene with no variation across samples contributes a missing z-score.

`geneEntries()` returns the character vector for one signature. `geneEntries("all")` returns a named list of all 42 sets. Every set is scored with this same mean z-score. Where the original paper used another method, such as the pairwise IMPRES comparisons in Auslander et al., `tmesig` stores the gene list and scores it with `calculateAvgZScore()`.

## Buffa hypoxia score

`calculateBuffa()` implements the Buffa et al. (2010) hypoxia metagene. For each of the 51 genes, a sample contributes `+1` when its expression is above that gene's median in the cohort and `-1` otherwise. The score is the sum of those contributions, returned as `sample` and `buffa.score`.

```r
calculateBuffa(expr)

# substitute updated symbols, then rescore
buffa <- inputGenes("Buffa")
calculateBuffa(expr, buffa.genes = buffa)
```

Genes in the signature that are missing from `expr` are left out of the sum. `checkGenes(expr$Gene, score = "Buffa")` lists them.

## OCR-score

`calculateOCRscore()` summarizes oxygen-demand hypoxia from Benej et al. It takes the mean of `log2(count + 1)` across 92 mitochondrial and oxidative-phosphorylation genes (electron-transport chain subunits, ATP synthase, and uncoupling proteins). The result has columns `sample` and `OCRscore`.

```r
calculateOCRscore(expr)
inputGenes("OCRscore")
```

Pass `ocr.genes` to use an updated symbol list. Missing symbols are left out of the mean.

## Small-cell neuroendocrine score

`calculateSCN()` follows Balanis et al. (Cancer Cell, 2019). Each gene's expression is multiplied by its PC1 weight, and those products are summed within each sample. The weights cover 18,686 genes (`gene` and `PC1`) and are installed with the package. `calculateSCN()` loads them itself. After `library(tmesig)`, `data(SCNweights)` loads the same object.

```r
calculateSCN(expr, gene_column = "Gene")
```

The result has columns `sample` and `SCN`. The function also sends a message reporting how many weight genes are absent from the matrix. Balanis and colleagues treat some of that missingness as acceptable; the message points back to their paper for that judgment. Pass expression on the scale you want weighted: `calculateSCN()` multiplies those values by the PC1 loadings directly.

## Checking genes

`checkGenes()` compares the symbols in your matrix with the symbols a score expects. It sends a message of `TRUE` when every expected symbol is present and `FALSE` otherwise, and it returns the missing names.

```r
checkGenes(expr$Gene, score = "Buffa")
checkGenes(expr$Gene, score = "OCRscore")
checkGenes(expr$Gene.Symbol, expected.genes = geneEntries("TLS"))
```

`inputGenes()` returns the built-in vectors used by the Buffa score and the OCR-score (`"Buffa"` or `"OCRscore"`). Signature genes for the z-score come from `geneEntries()` instead.

## Signature catalog

These are the sets `geneEntries()` returns. Gene membership is the vector stored in the package; retrieve it with `geneEntries("<name>")` rather than retyping it. A longer table, including individual gene symbols for many of these sets, is in the [user manual](https://github.com/spakowiczlab/tmesig/blob/master/doc/tmesig-documentation.md). The names and counts below follow the function.

### Immune activity and checkpoint-response programs

| Name | Genes | What the set captures | Reference |
| --- | ---: | --- | --- |
| `IFNg_6` | 6 | IFNγ-associated genes | Ayers et al. 2017 |
| `IFNg_18` | 18 | Expanded IFNγ immune signature | Ayers et al. 2017 |
| `IFNg_Effector_T_Cells` | 8 | IFNγ and effector T cells | Fehrenbacher et al. 2016 |
| `Effector_T_Cell` | 6 | Cytotoxic effector T cells | Bolen et al. |
| `Cytotoxic` | 7 | Cytotoxic immune infiltration | Davoli et al. 2017 |
| `Rooney_Immune_Cytolytic` | 2 | Cytolytic activity (`GZMA`, `PRF1`) | Rooney et al. 2015 |
| `Roh_Immune_Score` | 41 | Cytolytic effectors, HLA, IFNγ, chemokines, and adhesion genes | Roh et al. 2017 |
| `Ock_Immune_Sig_Score` | 105 | Immune signature used to separate checkpoint-blockade responders | Ock et al. 2017 |
| `Auslander` | 15 | Genes from the IMPRES checkpoint-pair panel | Auslander et al. 2018 |
| `Chaurio` | 7 | T and B cell response, including `CXCL13` | Chaurio et al. 2022 |
| `Huang_NRS` | 68 | Genes differing between recurrence and no recurrence | Huang et al. 2019 |
| `Ipi_neoadjuvant` | 32 | Proinflammatory microenvironment associated with neoadjuvant ipilimumab benefit | Tarhini et al. 2017 |
| `Pan` | 18 | DNA-repair panel associated with checkpoint-inhibitor response | Pan et al. |
| `TIP_Hot` | 12 | Inflamed ("hot") tumors | Wang et al. 2021 |
| `TLS` | 9 | Tertiary lymphoid structures | Cabrita et al. 2020 |
| `Tcell.Senescence` | 4 | T-cell senescence markers |  |
| `Chemokine` | 12 | Chemokine program | Coppola et al. 2011; Messina et al. 2012 |
| `Chemotaxis` | 70 | Leukocyte chemotaxis |  |
| `MHC_I` | 6 | MHC class I antigen presentation | Liu et al. 2021 |
| `MHC_II` | 13 | MHC class II antigen presentation | Liu et al. 2021 |
| `MHC_II_Hsueh` | 9 | MHC class II genes, including `CIITA` and `CD74` |  |

### Myeloid, stromal, and suppressive programs

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
| `Apoptosis` | 12 | Apoptosis pathway | Kiraz et al. 2016 |
| `Autophagy` | 9 | Autophagy pathway | Yamamoto et al. 2023 |
| `Ferroptosis` | 3 | Core ferroptosis markers |  |
| `Necroptosis` | 3 | Necroptosis pathway | Chen et al. 2019 |
| `Pyroptosis` | 8 | Pyroptosis pathway | Wang et al. 2022 |
| `CellDeath` | 15 | Mixed cell-death genes (autophagy, apoptosis, and death-receptor members) |  |

## References

1. Buffa, F. M., et al. "Large meta-analysis of multiple cancers reveals a common, compact and highly prognostic hypoxia metagene." *British Journal of Cancer* 102.2 (2010): 428–435.
2. Benej, M., et al. "Oxygen demand driven tumor hypoxia – a new perspective on the genesis and treatment of hypoxia." *Submitted.*
3. Balanis, N. G., et al. "Pan-cancer Convergence to a Small-Cell Neuroendocrine Phenotype that Shares Susceptibilities with Hematological Malignancies." *Cancer Cell* (2019).

Citations for the individual `geneEntries()` sets are in the [user manual](https://github.com/spakowiczlab/tmesig/blob/master/doc/tmesig-documentation.md).

## Authors

Rebecca Hoyd ([ORCID](https://orcid.org/0000-0003-1210-4491)), Caroline Wheeler ([ORCID](https://orcid.org/0000-0002-3374-4909)), and Daniel Spakowicz ([ORCID](https://orcid.org/0000-0003-2314-6435)). Maintainer: Daniel Spakowicz (daniel.spakowicz@osumc.edu).

MIT license.
