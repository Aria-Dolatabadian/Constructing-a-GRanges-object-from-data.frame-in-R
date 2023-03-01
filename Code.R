if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("BiocStyle")




suppressPackageStartupMessages({
 library(BiocStyle)
 library(GenomicRanges)
})



df <- data.frame(
    seqnames = rep(c("chr1", "chr2", "chr1", "chr3"), c(1, 3, 2, 4)),
    start = c(101, 105, 125, 132, 134, 152, 153, 160, 166, 170),
    end = c(104, 120, 133, 132, 155, 154, 159, 166, 171, 190),
    strand = rep(strand(c("-", "+", "*", "+", "-")), c(1, 2, 2, 3, 2)),
    score = 1:10,
    GC = seq(1, 0, length=10),
    row.names = head(letters, 10))
gr <- makeGRangesFromDataFrame(df, keep.extra.columns=TRUE)

gr
#exports in WD
write.csv(gr, "GRanges.csv", row.names=FALSE)


#Basic manipulation of GRanges objects

seqnames(gr)
ranges(gr)
strand(gr)
granges(gr)
start(gr)
end(gr)
width(gr)
mcols(gr)
mcols(gr)$score
score(gr)


seqinfo(gr) <- Seqinfo(genome="hg38")
seqinfo(gr)

#Subsetting GRanges objects
gr[2:3]
gr[2:3, "GC"]
subset(gr, strand == "+" & score > 5, select = score)


grMod <- gr
grMod[2] <- gr[1]
head(grMod, n=3)

rep(gr[2], times = 3)

rev(gr)

head(gr,n=2)

tail(gr,n=2)

window(gr, start=2,end=4)

gr[IRanges(start=c(2,7), end=c(3,9))]



