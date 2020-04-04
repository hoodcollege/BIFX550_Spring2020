# High-throughput Experiment
# Dr. S. Ravichandran--BIFX550

#----Reading a BAM FILE 
rm(list=ls())
library(RNAseqData.HNRNPC.bam.chr14)
library(GenomicAlignments)
library(Rsamtools)

bfp <- RNAseqData.HNRNPC.bam.chr14_BAMFILES
bamfile <- bfp[1]; bamfile

gal <- readGAlignments(bamfile)
# What is GAL? 
# GAL is genomic alignmnents object 
#Genomic Alignments of the reads that map to the reference
gal
?GAlignments
coverage(gal)

# if you have your own bam file then, use 
# 
# bamfile <- file.path("C:","users","ravichandrans","Docuemnts","PH525","extdata","a.bam")

# other functions or other information that we can get from this object
length(gal) # number of alignments
class( strand(gal) )  # RLE object
table(strand(gal)) # total # aligned to the + and total # aligned to - strand
table(strand(gal))
# Whatis RLE and RLE Ranges?

# here is a quick intro to Run Length Encoding (RLE)
x <- rep(6:10,1:5)
rle(x)

# browseVignettes("IRanges") 

head(seqnames(gal))

# Let us talk about how to restrict BAM reading to a certain range
# this can be done using ScanBamParm/ScanBamWhat functions
# scan parameters for scanning BAM files

?ScanBamParam
scanBamWhat() # ? col can we read 
scanBam(bamfile)[[1]]$seq

# What range I want to read
ranges(gal)[1:5]  #800484 reads

# 
gr <- GRanges(seqnames = "chr14",ranges=ranges(gal)[1:5])
seq_gal <- readGAlignments(bamfile,param=ScanBamParam(which=gr,what=c("seq","qual")))
class(seq_gal)

seq_gal
# you can read reads only from +ve strand
pos_gal <- readGAlignments(bamfile, param = ScanBamParam(which=gr,what="seq", 
                                                         flag=scanBamFlag(isMinusStrand = FALSE)))

pos_gal
# more on RLE
# browseVignettes("IRanges")  

