#########################################################
### A) Installing and loading required packages
#########################################################

if (!require("gplots")) {
   install.packages("gplots", dependencies = TRUE)
   library(gplots)
   }
if (!require("RColorBrewer")) {
   install.packages("RColorBrewer", dependencies = TRUE)
   library(RColorBrewer)
   }


#########################################################
### B) Reading in data and transform it into matrix format
#########################################################

data <- read.csv("taxa_by_locus_for_r_2.csv", comment.char="#")
rnames <- data[,1]                            # assign labels in column 1 to "rnames"
mat_data <- data.matrix(data[,2:ncol(data)])  # transform column 2-5 into a matrix
rownames(mat_data) <- rnames                  # assign row names 


#########################################################
### C) Customizing and plotting the heat map
#########################################################

# creates a own color palette from red to green
my_palette <- colorRampPalette(c("white", "gray", "black"))(n = 299)

# (optional) defines the color breaks manually for a "skewed" color transition
col_breaks = c(seq(0,0.2,length=100),  # for white
  seq(0.2,0.8,length=100),              # for gray
  seq(0.8,1,length=100))              # for black


png("taxa_by_locus_in_r_v2.png",    # create PNG for the heat map        
  width = 25*300,        # 15 x 300 pixels
  height = 20*300,
  res = 300,            # 300 pixels per inch
  pointsize = 36)        # smaller font size

heatmap.2(mat_data,
# cellnote = mat_data,  # same data set for cell labels
  main = "Correlation", # heat map title
#  notecol="black",      # change font color of cell labels to black
  density.info="none",  # turns off density plot inside color legend
  trace="none",         # turns off trace lines inside the heat map
  margins =c(12,9),     # widens margins around plot
  col=my_palette,       # use on color palette defined earlier 
  #breaks=col_breaks,    # enable color transition at specified limits
  #dendrogram="row",     # only draw a row dendrogram
  Colv="NA",            # turn off column clustering
  Rowv="NA",            # turn off row clustering
  labCol = "NA",            # turn off column names
key=TRUE, keysize = 1)

dev.off()               # close the PNG device

