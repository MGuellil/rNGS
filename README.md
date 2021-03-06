rNGS
====

**Experimental** R code for aDNA NGS analysis.

Under active development likely to change and break often, highly specialised to my own data.

The latest version can be installed with [devtools](http://www.rstudio.com/products/rpackages/devtools/).

* Requires the following R package [ggplot2](http://ggplot2.org/) 

* Needs the following pre-installed 
  * [BWA](http://bio-bwa.sourceforge.net/) 
  * [SAMtools](http://samtools.sourceforge.net/)
  * [Cutadapt](https://code.google.com/p/cutadapt/) 

* Example files are in data/

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

# Karyotype information
karyotype_info("/path_to_bam_file/file.bam")

# Sample sheet test
sample_sheet_test("/path_to_sample_sheet/sample_sheet.csv")
```
