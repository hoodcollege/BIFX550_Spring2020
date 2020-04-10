# High-throughput Experiment
# Dr. S. Ravichandran--BIFX550
#====================================
rm(list=ls())

if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")

library(devtools)
library(rafalib)
library(geneplotter)
library(Biobase)
library(RNAseqData.HNRNPC.bam.chr14)
library(GenomicAlignments)
library(Rsamtools)
library(GenomicAlignments)
library(BiocParallel) # not needed for Windows?? Not sure
library(GenomicAlignments)
library("GenomicFiles")
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(Homo.sapiens)

# read vcf file 
# VariantCall Format (VCF)
# VCF text files contain meta-information lines,
# a header line with column data lines with information 
# about position in the genome and optional genotype 
# information on samples for each position.
# 

library(VariantAnnotation)
# Example1
fl <- system.file('extdata','chr7-sub.vcf.gz',package="VariantAnnotation")
fl
# read VCF data into a VCF R object
# genomic objects are stored in GRanges object 
# with REF, ALT, FILTER, QUALITy and INFO fields
vcf1 <- readVcf(fl,'hg19')
vcf1 # 3791 variants and 2 samples
# Note the different slots of data
# Ex. rowRanges, info etc
rowRanges(vcf1)
head(rowRanges(vcf1))
rm(vcf1)

## example
fl <- system.file("extdata", "chr22.vcf.gz", package="VariantAnnotation")
fl
# read all data
vcf <- readVcf(fl,genome = 'hg19')
vcf
rowRanges(vcf)
# let us look at info slot with 
info(vcf)

# also look at geno slot
geno(vcf) # geno slot # GT: Genottype; DS: Genotype Dosage; GL: Gentotype likelihoods


# we see 5 samples, 1 piece of meta information, 22 info fields and 3 geno fields
header(vcf)
vcf
class(vcf)
samples(header(vcf))
info(vcf)
dim(vcf)
rowRanges(vcf) # old method is rowData(vcf1)

# 
geno(vcf) # geno slot # GT: Genottype; DS: Genotype Dosage; GL: Gentotype likelihoods
geno(header(vcf))
# select range
# variants only in this genomic range
which <- GRanges("22",IRanges(50500000,50600000))
which

# we can select the range 
param <- ScanVcfParam(which=which)
param

vcf2 <- readVcf(fl,"hg19",param=param)
vcf2
rowData(vcf2)
dim(vcf2)
head(vcf2)

# select fields 
# you can select the fields from VCF 
scanVcfHeader(fl)
param <- ScanVcfParam(info=c("LDAF","AVGPOST","SNPSOURCE"),geno="GT")
param
vcf3 <- readVcf(fl,"hg19",param=param)
vcf3
class(vcf3)
info(vcf3)
dim(vcf3)
info(header(vcf3))
ScanVcfParam(gene="GT", samples="NA00002")

# read single field
scanVcfHeader(fl)
ft <- readGeno(fl,"GT",row.names=FALSE)
ft; 
class(ft); dim(ft)
head(ft)
apply(ft,2,table) # we have two samples that satisify the FT use apply to get them out for furter computations
head(ft)
# expanded form
vranges <- readVcfAsVRanges(fl,"hg19",use.names = TRUE)
head(vranges,4)
 


