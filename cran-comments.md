## R CMD check results

There was 1 NOTE:

* checking R code for possible problems ... NOTE
  Undefined global functions or variables:
    Average Gene Gene.Symbol PC1 SCN.cont SCNweights counts gene
    logged.count score.comp std_dev z_score

These names are columns used inside dplyr verbs, or the SCNweights
object loaded with data() in calculateSCN(). They are not missing
functions.
