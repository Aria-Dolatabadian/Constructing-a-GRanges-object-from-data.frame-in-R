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
