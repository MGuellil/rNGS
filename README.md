rNGS
====

**Experimental** R code for aDNA NGS analysis

Under active development likely to change and break often, highly specialised to my own data.

The latest version can be installed with [devtools](http://www.rstudio.com/products/rpackages/devtools/)

Requires [ggplot2](http://ggplot2.org/)

Example files are in data/

```{R}
install.packages("ggplot2")
install.packages("devtools")
devtools::install_github("teasdalm/rNGS")
library(rNGS)
full_alignment("path_to_config_file/config_file.csv")
```
