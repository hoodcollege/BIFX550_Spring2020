# High-throughput Experiment
# Dr. S. Ravichandran--BIFX550
#====================================
#====================================
rm(list=ls())

if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")

library(devtools)

#install.packages("remotes")
# remotes::install_github("genomicsclass/ph525x")
#library(BiocInstaller)
library(rafalib)
library(geneplotter)
library(Biobase)
#BiocManager::install("RNAseqData.HNRNPC.bam.chr14")
library(RNAseqData.HNRNPC.bam.chr14)
library(GenomicAlignments)
library(Rsamtools)
# install_github("genomicsclass/ph525x") # depends on devtools
library(ph525x)

library(GenomicAlignments)
library(BiocParallel) # needed for Windows?? Not sure; just in case
library("GenomicFiles")
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(Homo.sapiens)

#The RNAseqData.HNRNPC.bam.chr14 package includes BAM files derived 
#from paired-end sequencing of 8 samples of HeLa cell lines, 4 of 
#which were subjected to RNA interference to "knock down" the expression 
#of the heterogeneous nuclear ribonucleoproteins C1 and C2 (denoted hnRNPC). 
#This family of nuclear proteins is involved in pre-mRNA processing. 

# What is Paired-end Reads
#                     ---->
#                     --------------------------
#                                          <----
#        Distance between the two paired end is known in advance
# 
# The package contains 8 BAM files, 1 per sequencing run. Each BAM file was 
# obtained by (1) aligning the reads (paired-end) to the full hg19 genome with 
# TopHat2, and then (2) subsetting to keep only alignments on chr14. See accession 
# number E-MTAB-1147 in the ArrayExpress database for details about the experiment, 
# including links to the published study (by Zarnack et al., 2012) and 
# to the FASTQ files.


#----single bam file
# Header section
# @HD     VN:1.0  SO:coordinate
# @SQ     SN:chr1 LN:249250621
# @SQ     SN:chr10        LN:135534747
# @SQ     SN:chr11        LN:135006516
# MetaData with sequence 
# HWI-ST1001:137:C12FPACXX:7:1115:14131:66670     0       chr1    12805   1       42M4I5M*       0       0       
# TTGGATGCCCCTCCACACCCTCTTGATCTTCCCTGTGATGTCACCAATATG     CCCFFFFFHHGHHJJJJJHJJJJJJJJJJJJJJJJIJJJJJJJJJJJJIJJ     
# AS:i:-28        XN:i:0  XM:i:2  XO:i:1XG:i:4   NM:i:6  MD:Z:2C41C2     YT:Z:UU NH:i:3  CC:Z:chr15      CP:i:102518319  XS:A:+  HI:i:0
#  read seq matched at position chr1:12805
# 42M4I5M* CIGAR String. 42M 42 nucleotides matches/did-not-matches 
#  and 4 Ins 5 Matches again did or did not match

# tab sep- file. For convenience I have written them in separate lines
# path for Bam files
bfp <- RNAseqData.HNRNPC.bam.chr14_BAMFILES
bamfile <- bfp[1]
bamfile

################-Start Reading Analyzing BamFile-###############
###How to read a bamfile? 
# if you have your own bam file then, use 
# 
# bamfile <- file.path("C:","users","ravichandrans","Docuemnts","PH525","extdata","a.bam")

class(bfp)

gal <- readGAlignments(bamfile)
#Genomic Alignments of the read to the reference
?GAlignments  # help pages

# accessor functions
length(gal) # number of alignments
class( strand(gal) )  # RLE object; IRanges object
strand(gal)
table(strand(gal))
# Whatis RLE and RLE Ranges?
# browseVignettes("IRanges") 
gal # Gene Alignment Object
# scan parameters for scanning BAM files
?ScanBamParam  # what do you want to get our
scanBamWhat() # ? col can we read 
ranges(gal)[1:5]  #800484 reads
# If I want to read from a specific region I can set it up
# in the following way
gr <- GRanges(seqnames = "chr14",ranges=ranges(gal)[1:5])
seq_gal <- readGAlignments(bamfile,param=ScanBamParam(which=gr,what=c("seq","qual")))
seq_gal
# you can read reads only from +ve strand
pos_gal <- readGAlignments(bamfile, 
                        param = ScanBamParam(which=gr,what="seq", 
                        flag=scanBamFlag(isMinusStrand = FALSE)))

pos_gal
# more on RLE
browseVignettes("IRanges") # manual for RLE and ranges
table(strand(gal)) # total # aligned to the + and total # aligned to - strand
class(gal)

### Second example

#untreated1.bam and untreated3.bam were obtained from the RNA-Seq
#read sequence data that is provided by NCBI Gene Expression Omnibus
#under accession numbers GSM461176 to GSM461181. Also contains
#the DNA sequence for fly chromosome 4 to which the reads can
#be mapped.
library(pasillaBamSubset)
un1 <- untreated1_chr4() # single-end reads
library(GenomicAlignments)
gal <- readGAlignments(un1)
#Data subsets can be specified by genomic position, field names, or flag criteria in the ScanBamParam. Here we input
#records that overlap position 1 to 5000 on the negative strand with flag and cigar as metadata columns.
what <- c("flag", "cigar")
which <- GRanges("chr4", IRanges(1, 5000))
flag <- scanBamFlag(isMinusStrand = TRUE)
param <- ScanBamParam(which=which, what=what, flag=flag)
neg <- readGAlignments(un1, param=param)
neg # reads that overlap alignments between 1 to 5000 on 
    # the negative strand

# let us see how we can read a paired-end reads 
un3 <- untreated3_chr4()  # paried end reads
gapairs <- readGAlignmentPairs(un3)
gapairs

# homo.sapiens
library(Homo.sapiens)
Homo.sapiens
genes(Homo.sapiens) #GRanges object comes back
seqinfo(Homo.sapiens)

