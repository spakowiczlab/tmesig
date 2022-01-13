# tmesig <img src="man/figures/hex-sticker.png" align="right" width="100" />

## Tumor MicroEnvironment expression signatures                    

[![DOI](https://zenodo.org/badge/424702817.svg)](https://zenodo.org/badge/latestdoi/424702817)

## Overview

Contains functions to generate gene expression signature values from (1) an expression matrix and (2) a list of genes. 

`calculateBuffa` calculates a hypoxia signature from Buffa et al (2010).[1]

`calculateMitoscore` calculates a hypoxia signature from Benej et al (submitted).[2]

## Installation

``` r
# Currently available as the development version on GitHub
install.packages("devtools")
devtools::install_github("spakowiczlab/tmesig")
```

## References

1. Buffa, F. M., et al. "Large meta-analysis of multiple cancers reveals a common, compact and highly prognostic hypoxia metagene." British journal of cancer 102.2 (2010): 428-435.
2. Benej, M., et al. "Oxygen demand driven tumor hypoxia – a new perspective on the genesis and treatment of hypoxia." _submitted_
