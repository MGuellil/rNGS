rNGS
====

**Experimental** R code for aDNA NGS analysis

Under active development likely to change and break often, highly specialised to my own data.

The latest version can be installed with [devtools](http://www.rstudio.com/products/rpackages/devtools/)

Requires [ggplot2](http://ggplot2.org/)

Example files are in data/

* Basic overview
```{R}
# Install required packages
install.packages("ggplot2")
install.packages("devtools")

# Load rNGS
devtools::install_github("teasdalm/rNGS")
library(rNGS)

# Preform a full alignment
full_alignment("path_to_config_file/config_file.csv")
```
