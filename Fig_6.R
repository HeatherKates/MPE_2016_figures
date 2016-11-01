library(ape)
library(phytools)
install.packages("ggplot2")
library(ggplot2)

#read in and rotate tree
tree <- read.tree(file="Tree_for_ACE_with_BL.nex")
tree2 <- rotate(tree,13)
tree3 <- rotate(tree2,15)
tree4 <- rotate(tree3,c("Xerophytes_1","Cucurbita_lundelliana"))
tree5 <- rotate(tree4,17)
tree6 <- rotate(tree5,18)
tree7 <- rotate(tree6,19)
tree8 <- rotate(tree7,c("Cucurbita_lundelliana","Cucurbita_okeechobeensis"))
tree9 <- rotate(tree8,c("Cucurbita_argyrosperma","Cucurbita_moschata"))
tree10 <- rotate(tree9,c("Cucurbita_maxima","Cucurbita_ecuadorensis"))

#read in character matrix
chars <- read.csv("Fig_6.csv", row.names=1)
chars <- as.matrix(chars)[,1]

cols <- c("black","gray")
#character vector for tip labels
chars2 <- c(1,0,0,0,0,0,0,0,0,1,1,0)


#Run ACE
fitER <- ace(chars,tree10,model="ARD",type="discrete")
round(fitER$lik.anc,3)
tiff("test.tiff", res=300)
#Plot the tree with pie charts at internal nodes and at tips
par(mar = rep(2, 4))
plot.phylo(tree10,edge.width=4,align.tip.label = TRUE,font = 4, cex=1)
nodelabels(node=1:tree10$Nnode+Ntip(tree10),
           pie=fitER$lik.anc,piecol=cols,cex=0.7)
tiplabels(pie=to.matrix(chars2,sort(unique(chars2))),piecol=cols,cex=0.3)

dev.off()

nodelabels()

#add.simmap.legend(colors=cols,prompt=TRUE,x=0.9*par()$usr[1],
#                  y=-max(nodeHeights(tree)),fsize=0.4)


