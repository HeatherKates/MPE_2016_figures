library(ape)
library(distory)
library(phytools)
#read in


Alleles <- ladderize(Alleles)
Ambiguity <- ladderize(Ambiguity)
Alleles <- root(Alleles,"Cucumis_sativus")
Ambiguity <- root(Ambiguity,"Cucumis_sativus")
plot.phylo(Ambiguity_2)
Alleles <- read.tree("alleles_phylodiff")
Ambiguity <- read.tree("ambiguity_phylodiff")
Ambiguity_2 <- rotate(Ambiguity,c("C_foetidissima_Mexico","C_ecuadorensis_Ecuador_1"))

#run phylo.diff
phylo.diff(Ambiguity,Alleles, direction=("leftwards"), edge.width=4, font=4, cex=1.1, no.margin=TRUE, x.lim=32)
phylo.diff(Ambiguity,Alleles, direction=("rightwards"), edge.width=4, font=4, cex=1.1, no.margin=TRUE, x.lim=32)

length(Alleles$tip.label)
temp <- paste(c(Alleles$tip.label,Ambiguity$tip.label))
sort(temp)
length(unique(temp))
plot.phylo(Ambiguity)
