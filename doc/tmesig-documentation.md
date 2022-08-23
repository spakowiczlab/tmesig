tmesig documentation
================
2022-07-13

## Z Score Calculations

### calculate_avg_z\_score

`calculate_avg_z_score` is a function that takes a data frame and
calculates the average z score for all the values in a given data set

``` r
calculateAvgZScore(gene_matrix = expressions, gene_list = c("RNF43","BMP4","TSPAN8","PPP1R1B","SLC44A4","C9orf152","VWA2","AXIN2","SP5","NKD1","CFTR","LGR5","ODAM"))
```

### geneEntries

`geneEntries` contains genes within vectors which are signatures

``` r
geneEntries("IFNg_18")
```

`calculate_avg_z_score` can be used with `gene_entires` to pull
signatures

``` r
calculate_avg_z_score(gene_matrix = expressions, gene_list = gene_entries("IFNg_18"))
```

### Table of Signatures

The table below includes each of the signatures along that we have
implemented into the geneEntries function
