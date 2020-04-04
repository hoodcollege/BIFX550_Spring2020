# S. Ravichandran, PhD Hood College
# revised 04/04/2020

#====================================
rm(list=ls())

# run to make sure you have Bioconductor
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")


library(SNPlocs.Hsapiens.dbSNP144.GRCh37)

# if you get a complaint then install the library using the 
# following command

# BiocManager::install("SNPlocs.Hsapiens.dbSNP144.GRCh37")

library(BSgenome.Hsapiens.UCSC.hg19)
# if you get a complaint then install the library using the 
# following command.
# BiocManager::install("BSgenome.Hsapiens.UCSC.hg19")

# to get help
# browseVignettes(package = "Biostrings")

library(airway)
# BiocManager::install("airway") 

# 
# This package provides a RangedSummarizedExperiment object of 
# read counts in genes for an RNA-Seq experiment on four human 
# airway smooth muscle cell lines treated with dexamethasone. 
# Details on the gene model and read counting procedure are 
# provided in the package vignette. The citation for the experiment 
# is: Himes BE, Jiang X, Wagner P, Hu R, Wang Q, Klanderman B, 
# Whitaker RM, Duan Q, Lasky-Su J, Nikolos C, Jester W, Johnson M, 
# Panettieri R Jr, Tantisira KG, Weiss ST, Lu Q. 
# 'RNA-Seq Transcriptome Profiling Identifies CRISPLD2 as a 
# Glucocorticoid Responsive Gene that Modulates Cytokine Function 
# in Airway Smooth Muscle Cells.' PLoS One. 2014 Jun 13;9(6):e99625. 
# PMID: 24926665. GEO: GSE52778.


library(airway)
data(airway)
class(airway) # https://www.bioconductor.org/packages/release/bioc/vignettes/SummarizedExperiment/inst/doc/SummarizedExperiment.html
airway
metadata(airway)
#The features that are quantified are exons, annotated using ENSEMBL nomenclature.
rowRanges(airway)

# access a particular gene
rowRanges(airway)$ENSG00000172057

#We will look closely at the GenomicRanges 
#infrastructure for working with structures like this. 
#To check for the existence of overlapping regions in this 
#list of exon coordinates, we can use the reduce method:
  
reduce(rowRanges(airway)$ENSG00000172057)


#xercise 1
# let us explore the genome
BSgenome.Hsapiens.UCSC.hg19
chr11seq <- BSgenome.Hsapiens.UCSC.hg19[["chr11"]]
chr11seq[100000:100002]

#Exercise2: let us take a slice of Chr11 chromosome 
# at a specific place
#Here, for example, is a segment of 25 bases starting  at base 1 million 

subseq(chr11seq,start=10^6,width=25)

seqs = c("ATG", "TGA", "TAA","TAG")
n =sapply(seqs, function(x) countPattern(x,chr11seq))
which.max(n)

#
# Exercise 3: Let us count alphabet frequencies
chr6seq = BSgenome.Hsapiens.UCSC.hg19$chr6
alphabetFrequency(chr6seq)
# try other posibilities

#  Exercise 4
snps144 = SNPlocs.Hsapiens.dbSNP144.GRCh37
snps144
snpcount(snps144)





