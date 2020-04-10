# Bioconductor and related packages

# to install Bioconductor
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.10")

# to install a package, use the following command
BiocManager::install("Biostrings")

# you can install one package at a time or 
# string them using concatenate command (c)
# to install more than one (see below for example)

# if asked for update, choose "a" to update all. 

# to load a package, use
library(Biostrings)

# we need the following libraries, if you dont have then 
# instll them. 
# If you have few of the following, then skip them. 

 BiocManager::install("Biostrings")
 BiocManager::install("GenomeGraphs")
 BiocManager::install("BSgenome.Hsapiens.UCSC.hg19")
 BiocManager::install("SNPlocs.Hsapiens.dbSNP144.GRCh37")
 BiocManager::install(c("zlibbioc","Biostrings", "GenomeGraphs", 
           "seqinr", "Biobase", "rafalib", "GEOquery", "affy", 
           "limma","annotate", "RNASeqPower", "cummeRbund", "GenomicRanges", "stats", 
           "Rbowtie", "Rsamtools", "zlibbioc", "geneplotter", "Biobase", "Homo.sapiens")))

BiocManager::install("airway")
BiocManager::install("RNAseqData.HNRNPC.bam.chr14")
BiocManager::install("GenomicAlignments")
BiocManager::install("GenomicFiles")
BiocManager::install("Homo.sapiens")
BiocManager::install("pasillaBamSubset")
BiocManager::install("Homo.sapiens")
BiocManager::install("TxDb.Hsapiens.UCSC.hg19.knownGene")
BiocManager::install("BiocParallel")


# R libraries (other than Bioconductor)

# R libraries can be installed using the following command, for example,
# install.packages("rafalib")  

rafalib
devtools
tidyverse

 

 