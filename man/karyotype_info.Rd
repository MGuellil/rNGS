% Generated by roxygen2 (4.0.2): do not edit by hand
\name{karyotype_info}
\alias{karyotype_info}
\title{Karyotype Info}
\usage{
karyotype_info(bam_file, need_index = TRUE, draw_plot = TRUE)
}
\arguments{
\item{bam_file}{BAM f alignment}

\item{need_index}{Do we need to index the BAM file default is TRUE}

\item{draw_plot}{Do you want an output plot default is TRUE}
}
\description{
R function to try to sex an aDNA sample by using alignment to autosomes
and the X-Chromosome
}
\examples{
Karyotype_info(bam_file)
}
\keyword{SAMtools}

