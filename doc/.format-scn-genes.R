scn.genes <- readxl::read_excel("../data-raw/1-s2.0-S153561081930296X-mmc2.xlsx",
                                skip = 5)
scn.form <- scn.genes[,7:8]
colnames(scn.form) <- c("gene", "PC1")
SCNweights <- scn.form

save(SCNweights, file = "../Data/SCNweights.rda")
