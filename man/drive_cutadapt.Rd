% Generated by roxygen2 (4.0.2): do not edit by hand
\name{drive_cutadapt}
\alias{drive_cutadapt}
\title{drive_cutadapt}
\usage{
drive_cutadapt(raw_fastq, overlap = "1", min_lenght = "30", error = "0.1",
  adapter = "AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC", return_name = TRUE)
}
\arguments{
\item{raw_fastq}{raw fastq_file}

\item{overlap}{overlap into read - default 1bp}

\item{error}{error rate - default 0.1}

\item{adapter}{adater sequence to trim - default Meyer 2010}

\item{return_name}{return name of cutadapt output file}

\item{min_length}{minmum length of read - default 30bp}
}
\description{
R function to drive cutadapt
}
\examples{
drive_cutadapt("input_raw.fastq", "1", "AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC", "0.1", return_name = TRUE)
}
\keyword{cutadapt}

