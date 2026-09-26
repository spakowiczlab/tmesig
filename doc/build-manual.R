# Rebuild doc/tmesig-documentation.md from geneEntries().
# Run from the repository root: Rscript doc/build-manual.R

source("R/geneEntries.R")
sigs <- geneEntries("all")

meta <- list(
  IFNg_6 = list("Immune activity", "IFNg-associated genes", "Ayers et al. 2017", "https://doi.org/10.1172/JCI91190"),
  IFNg_18 = list("Immune activity", "Expanded IFNg immune signature", "Ayers et al. 2017", "https://doi.org/10.1172/JCI91190"),
  IFNg_Effector_T_Cells = list("Immune activity", "IFNg and effector T cells", "Fehrenbacher et al. 2016", "https://doi.org/10.1016/S0140-6736(16)00587-0"),
  Effector_T_Cell = list("Immune activity", "Cytotoxic effector T cells", "Bolen et al.", "https://doi.org/10.1182/bloodadvances.2016000786"),
  Cytotoxic = list("Immune activity", "Cytotoxic immune infiltration", "Davoli et al. 2017", "https://doi.org/10.1126/science.aaf8399"),
  Rooney_Immune_Cytolytic = list("Immune activity", "Cytolytic activity (GZMA, PRF1)", "Rooney et al. 2015", "https://doi.org/10.1016/j.cell.2014.12.033"),
  Roh_Immune_Score = list("Immune activity", "Cytolytic effectors, HLA, IFNg, chemokines, and adhesion genes", "Roh et al. 2017", "https://doi.org/10.1126/scitranslmed.aah3560"),
  Ock_Immune_Sig_Score = list("Immune activity", "Immune signature used to separate checkpoint-blockade responders", "Ock et al. 2017", "https://doi.org/10.1038/s41467-017-01018-0"),
  Auslander = list("Immune activity", "Genes from the IMPRES checkpoint-pair panel", "Auslander et al. 2018", "https://doi.org/10.1038/s41591-018-0157-9"),
  Chaurio = list("Immune activity", "T and B cell response, including CXCL13", "Chaurio et al. 2022", "https://doi.org/10.1016/j.immuni.2021.12.007"),
  Huang_NRS = list("Immune activity", "Genes differing between recurrence and no recurrence", "Huang et al. 2019", "https://doi.org/10.1038/s41591-019-0357-y"),
  Ipi_neoadjuvant = list("Immune activity", "Proinflammatory microenvironment associated with neoadjuvant ipilimumab benefit", "Tarhini et al. 2017", "https://doi.org/10.1080/2162402X.2016.1231291"),
  Pan = list("Immune activity", "DNA-repair panel associated with checkpoint-inhibitor response", "Pan et al.", "https://doi.org/10.1002/cti2.1145"),
  TIP_Hot = list("Immune activity", "Inflamed (hot) tumors", "Wang et al. 2021", "https://doi.org/10.1126/sciadv.abd7851"),
  TLS = list("Immune activity", "Tertiary lymphoid structures", "Cabrita et al. 2020", "https://doi.org/10.1038/s41586-019-1914-8"),
  Tcell.Senescence = list("Immune activity", "T-cell senescence markers", "", ""),
  Chemokine = list("Immune activity", "Chemokine program", "Coppola et al. 2011; Messina et al. 2012", "https://doi.org/10.1016/j.ajpath.2011.03.007"),
  Chemotaxis = list("Immune activity", "Leukocyte chemotaxis", "", ""),
  MHC_I = list("Immune activity", "MHC class I antigen presentation", "Liu et al. 2021", "https://doi.org/10.1038/s41591-021-01331-8"),
  MHC_II = list("Immune activity", "MHC class II antigen presentation", "Liu et al. 2021", "https://doi.org/10.1038/s41591-021-01331-8"),
  MHC_II_Hsueh = list("Immune activity", "MHC class II genes, including CIITA and CD74", "", ""),
  gMDSC = list("Myeloid and stromal", "Granulocytic myeloid-derived suppressor cells", "Cristescu et al. 2022", "https://doi.org/10.1158/1078-0432.CCR-21-3337"),
  mMDSC = list("Myeloid and stromal", "Monocytic myeloid-derived suppressor cells", "Cristescu et al. 2022", "https://doi.org/10.1158/1078-0432.CCR-21-3338"),
  Neutrophil_Activation = list("Myeloid and stromal", "Neutrophil activation", "", ""),
  NADPH_Oxidase = list("Myeloid and stromal", "NADPH oxidase complex", "", ""),
  Phagocytosis = list("Myeloid and stromal", "Phagocytosis machinery", "", ""),
  Adenosine = list("Myeloid and stromal", "Adenosine signaling", "Augustin, Leone, Naing et al.", "https://doi.org/10.1136/jitc-2021-004089"),
  Stroma = list("Myeloid and stromal", "Stromal infiltration", "Cristescu et al. 2022", "https://doi.org/10.1158/1078-0432.CCR-21-3330"),
  Angiogenesis = list("Myeloid and stromal", "Angiogenesis", "Cristescu et al. 2022", "https://doi.org/10.1158/1078-0432.CCR-21-3336"),
  Hypoxia = list("Tumor cell state", "Transcriptional response to hypoxia", "Cristescu et al. 2022", "https://doi.org/10.1158/1078-0432.CCR-21-3334"),
  Glycolysis = list("Tumor cell state", "Glucose transport and glycolysis", "Cristescu et al. 2022", "https://doi.org/10.1158/1078-0432.CCR-21-3335"),
  Proliferation = list("Tumor cell state", "Cell-cycle and proliferation genes", "Cristescu et al. 2022", "https://doi.org/10.1158/1078-0432.CCR-21-3329"),
  MYC = list("Tumor cell state", "MYC pathway activation", "Cristescu et al. 2022", "https://doi.org/10.1158/1078-0432.CCR-21-3332"),
  Ras = list("Tumor cell state", "RAS pathway", "Cristescu et al. 2022", "https://doi.org/10.1158/1078-0432.CCR-21-3331"),
  WNT = list("Tumor cell state", "WNT pathway, including genes used to recognize WNT-mutant tumors", "Cristescu et al. 2022", "https://doi.org/10.1158/1078-0432.CCR-21-3333"),
  LKB1_loss = list("Tumor cell state", "Expression pattern associated with LKB1 loss", "Kaufman et al. 2014", "https://doi.org/10.1097/JTO.0000000000000173"),
  Apoptosis = list("Cell death", "Genes upregulated with apoptosis", "Kiraz et al. 2016", "https://doi.org/10.1007/s13277-016-5035-9"),
  Autophagy = list("Cell death", "Genes upregulated with autophagy", "Yamamoto et al. 2023", "https://doi.org/10.1038/s41576-022-00562-w"),
  Ferroptosis = list("Cell death", "Core ferroptosis markers", "", ""),
  Necroptosis = list("Cell death", "Genes upregulated with necroptosis", "Chen et al. 2019", "https://doi.org/10.3390/cells8121486"),
  Pyroptosis = list("Cell death", "Genes upregulated with pyroptosis", "Wang et al. 2022", "https://doi.org/10.3390/cancers14010237"),
  CellDeath = list("Cell death", "Mixed cell-death genes spanning autophagy, apoptosis, and death receptors", "", "")
)

missing_meta <- setdiff(names(sigs), names(meta))
extra_meta <- setdiff(names(meta), names(sigs))
if (length(missing_meta) || length(extra_meta)) {
  stop(
    "Signature metadata is out of date.\nMissing: ",
    paste(missing_meta, collapse = ", "),
    "\nExtra: ",
    paste(extra_meta, collapse = ", ")
  )
}

wrap_genes <- function(genes, width = 88) {
  line <- ""
  lines <- character()
  for (g in genes) {
    piece <- if (nchar(line) == 0) g else paste0(line, ", ", g)
    if (nchar(piece) > width && nzchar(line)) {
      lines <- c(lines, paste0(line, ","))
      line <- g
    } else {
      line <- piece
    }
  }
  if (nzchar(line)) lines <- c(lines, line)
  paste(lines, collapse = "\n")
}

md_cell <- function(x) gsub("|", "\\|", x, fixed = TRUE)

table_for <- function(group) {
  names_in_group <- Filter(function(nm) meta[[nm]][[1]] == group, names(meta))
  rows <- vapply(names_in_group, function(nm) {
    info <- meta[[nm]]
    ref <- if (nzchar(info[[3]])) md_cell(info[[3]]) else ""
    paste0("| `", nm, "` | ", length(sigs[[nm]]), " | ", md_cell(info[[2]]), " | ", ref, " |")
  }, character(1))
  c(
    "| Name | Genes | What the set captures | Reference |",
    "| --- | ---: | --- | --- |",
    rows,
    ""
  )
}

gene_section <- function(group) {
  names_in_group <- Filter(function(nm) meta[[nm]][[1]] == group, names(meta))
  chunks <- lapply(names_in_group, function(nm) {
    info <- meta[[nm]]
    ref <- sub("\\.$", "", info[[3]])
    cite <- if (nzchar(ref) && nzchar(info[[4]])) {
      paste0(ref, ". [DOI](", info[[4]], ")")
    } else if (nzchar(ref)) {
      ref
    } else if (nzchar(info[[4]])) {
      paste0("[DOI](", info[[4]], ")")
    } else {
      ""
    }
    header <- paste0("#### `", nm, "`")
    blurb <- paste0(info[[2]], " (", length(sigs[[nm]]), " genes)", if (nzchar(cite)) paste0(". ", cite) else "", ".")
    c(header, "", blurb, "", wrap_genes(sigs[[nm]]), "")
  })
  unlist(chunks)
}

groups <- c("Immune activity", "Myeloid and stromal", "Tumor cell state", "Cell death")

lines <- c(
  "# tmesig user manual",
  "",
  "2026-09-25",
  "",
  "`tmesig` turns a bulk expression matrix into per-sample scores for tumor-microenvironment and tumor-cell programs. Four functions do the scoring. `geneEntries()` holds the gene lists used by the average z-score.",
  "",
  "Gene lists in this manual are the vectors `geneEntries()` returns. Rebuild this file from the repository root with `Rscript doc/build-manual.R` after changing a signature.",
  "",
  "## Expression matrix",
  "",
  "Pass a data frame with genes in rows and samples in columns. One column holds gene symbols. Every other column is a sample.",
  "",
  "| Function | Symbol column |",
  "| --- | --- |",
  "| `calculateAvgZScore()` | `Gene.Symbol` |",
  "| `calculateBuffa()`, `calculateOCRscore()` | `Gene` |",
  "| `calculateSCN()` | The column named in `gene_column` |",
  "",
  "Symbols are matched as written. Several published sets still use older aliases (`IL8`, `ERO1L`, `GPR124`, `HIG2`, and similar). `checkGenes()` lists symbols that are missing from the matrix.",
  "",
  "The Buffa score and the average z-score are relative to the samples in the matrix. Adding or removing samples changes those scores. The OCR-score and the SCN score are computed from each sample's own expression values.",
  "",
  "## calculateAvgZScore",
  "",
  "Standardizes each gene across samples (mean and standard deviation of that gene), keeps the requested symbols, and returns the mean z-score for each sample.",
  "",
  "```r",
  "expr <- data.frame(",
  "  Gene.Symbol = c(\"GZMA\", \"PRF1\", \"CD8A\"),",
  "  sample1 = c(10, 5, 8),",
  "  sample2 = c(1, 2, 3),",
  "  sample3 = c(4, 6, 2)",
  ")",
  "calculateAvgZScore(expr, genes = c(\"GZMA\", \"PRF1\"))",
  "calculateAvgZScore(expr, genes = geneEntries(\"IFNg_18\"))",
  "```",
  "",
  "The result has columns `sample` and `avg_z_score`. `checkGenes()` runs first and sends a message of `TRUE` when every requested symbol is present and `FALSE` otherwise. Missing symbols are reported in a second message and left out of the mean. A gene with no variation across samples contributes a missing z-score.",
  "",
  "Every set from `geneEntries()` is scored this way, including sets whose original paper used another algorithm. The Auslander genes, for example, are the IMPRES panel stored as a gene list and scored as a mean z-score.",
  "",
  "## geneEntries",
  "",
  "```r",
  "geneEntries(\"IFNg_18\")",
  "geneEntries(\"Apoptosis\")",
  "names(geneEntries(\"all\"))",
  "```",
  "",
  paste0("`geneEntries(\"all\")` returns a named list of ", length(sigs), " signatures. An unknown name returns `NULL`."),
  "",
  "## calculateBuffa",
  "",
  "Buffa et al. (2010) hypoxia metagene. For each gene in the 51-gene set, a sample contributes `+1` when its expression is above that gene's median in the cohort and `-1` otherwise. The score is the sum of those contributions.",
  "",
  "```r",
  "calculateBuffa(expr)",
  "inputGenes(\"Buffa\")",
  "calculateBuffa(expr, buffa.genes = inputGenes(\"Buffa\"))",
  "```",
  "",
  "`expr` needs a column named `Gene`. The result has columns `sample` and `buffa.score`. Genes from the signature that are absent in `expr` are left out of the sum. Because the threshold is the cohort median, the score depends on which samples are included.",
  "",
  "## calculateOCRscore",
  "",
  "Benej et al. OCR-score for oxygen-demand hypoxia. Mean of `log2(count + 1)` across 92 mitochondrial and oxidative-phosphorylation genes (electron-transport chain subunits, ATP synthase, and uncoupling proteins).",
  "",
  "```r",
  "calculateOCRscore(expr)",
  "inputGenes(\"OCRscore\")",
  "```",
  "",
  "`expr` needs a column named `Gene`. The result has columns `sample` and `OCRscore`. Pass `ocr.genes` to substitute updated symbols. Missing symbols are left out of the mean.",
  "",
  "## calculateSCN",
  "",
  "Balanis et al. (Cancer Cell, 2019) small-cell neuroendocrine score. Each gene's expression is multiplied by its PC1 weight, and those products are summed within the sample. Expression is used on the scale you supply.",
  "",
  "The weights are installed with the package (`gene` and `PC1`, 18,686 genes). `calculateSCN()` loads them from the package. `data(SCNweights)` loads the same object for inspection.",
  "",
  "```r",
  "calculateSCN(expr, gene_column = \"Gene\")",
  "```",
  "",
  "`gene_column` is the name of the symbol column. The result has columns `sample` and `SCN`. The function sends a message reporting how many weight genes are absent from the matrix. Balanis and colleagues treat some of that missingness as acceptable.",
  "",
  "## checkGenes and inputGenes",
  "",
  "`checkGenes()` compares symbols in the matrix with the symbols a score expects. It sends a message of `TRUE` or `FALSE` and returns the missing names.",
  "",
  "```r",
  "checkGenes(expr$Gene, score = \"Buffa\")",
  "checkGenes(expr$Gene, score = \"OCRscore\")",
  "checkGenes(expr$Gene.Symbol, expected.genes = geneEntries(\"TLS\"))",
  "```",
  "",
  "`score` accepts `\"Buffa\"` or `\"OCRscore\"` and uses `inputGenes()`. For a z-score signature, pass `expected.genes = geneEntries(...)` and leave `score` as `NULL`. `inputGenes()` itself returns the Buffa or OCR-score character vector.",
  "",
  "## Signature catalog",
  "",
  paste0(length(sigs), " signatures are available from `geneEntries()`. Retrieve a list with `geneEntries(\"<name>\")`."),
  ""
)

for (group in groups) {
  lines <- c(lines, paste("###", group), "", table_for(group))
}

lines <- c(lines, "## Genes in each signature", "")
for (group in groups) {
  lines <- c(lines, paste("###", group), "", gene_section(group))
}

lines <- c(
  lines,
  "## References",
  "",
  "1. Buffa, F. M., et al. \"Large meta-analysis of multiple cancers reveals a common, compact and highly prognostic hypoxia metagene.\" *British Journal of Cancer* 102.2 (2010): 428-435.",
  "2. Benej, M., et al. \"Oxygen demand driven tumor hypoxia - a new perspective on the genesis and treatment of hypoxia.\" *Submitted.*",
  "3. Balanis, N. G., et al. \"Pan-cancer Convergence to a Small-Cell Neuroendocrine Phenotype that Shares Susceptibilities with Hematological Malignancies.\" *Cancer Cell* (2019).",
  "",
  "Signature-level citations are listed with each gene set above. The chemokine set also draws on Messina et al. 2012 ([DOI](https://doi.org/10.1038/srep00765)).",
  ""
)

writeLines(lines, "doc/tmesig-documentation.md", useBytes = FALSE)
message("Wrote doc/tmesig-documentation.md with ", length(sigs), " signatures")
