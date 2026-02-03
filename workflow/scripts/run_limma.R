#!/usr/bin/env Rscript

### Packages ###
library(data.table)
library(limma)
# library(optparse)

### Functions ###
load_frame <- function(filename, sep="\t")
{
    frame <- fread(filename, sep=sep, header=TRUE)
    frame <- data.frame(frame, check.names=FALSE)
    rownames(frame) <- frame[[1]]
    frame <- frame[-1]
    return (frame)
}

### Main body ###
# optparse business
args <- commandArgs(TRUE)

data <- load_frame(args[1], sep=",")
targets <- load_frame(args[2])
groupA <- args[3]
groupB <- args[4]
outfile <- args[5]

Paired <- factor(targets$Paired)
Condition <- factor(targets$Condition, levels=c(groupA, groupB))
design <- model.matrix(~ Paired + Condition)

fit <- lmFit(data[rownames(targets)], design)
fit <- eBayes(fit)
label <- paste0("Condition", toString(groupB))
results <- topTable(fit, coef=label, number=Inf)

write.table(results, file=outfile, quote=FALSE, sep='\t', col.names=NA)