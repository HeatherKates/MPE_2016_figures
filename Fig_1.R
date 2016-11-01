#read data of cucurbita species occurence 
data <- read.csv("Fig_1.csv")
#removes datapoints for occurrences in Brazil
noBR_data <- subset(data, countrycode!="BR")
noBR_CO_data <- subset(noBR_data, countrycode!="CO")
require(maps)
colors <- rainbow(100)
new_world <- c("Brazil", 
  "Colombia", "Argentina","Peru","Venezuela","Chile",
  "Ecuador","Bolivia","Paraguay","Uruguay","Guyana",
  "Suriname","French Guiana","Falkland Islands","Mexico",
  "Belize","Costa Rica","El Salvador","Guatemala","Honduras"
  ,"Nicaragua","Panama","USA(?!:Alaska)","Canada")

tiff(file = "domesticates.tiff", width = 3200, height = 3200, units = "px", res = 800)
map(database="world",regions = new_world,col="cornsilk2",fill=TRUE,bg="lightblue1")

#plots the distribution of Cucurbita species from csv
points(noBR_CO_data$decimallongitude, noBR_CO_data$decimallatitude, col = "darkslategray4", cex = 0.5, pch=20)
#Plots the hypothesized origins of domestication
#C pepo pepo domestication in N Mexico
points(-98.8,24.2669, col="lightgreen",pch=17, cex=1.5)
#C argyrosperma domestication in S Mexico
points(-106.71,23.65,col="blue",pch=17, cex=1.5)
#C moschata domestication in Colombia
points(-74.2973,4.5709, col="magenta",pch=17, cex=1.5)
#C ficifolia domestication in the Andes
points(-67.9512,-22.3673,col="skyblue",pch=17, cex=1.5)
#C pepo ovifera domestication in the SE US
points(-91.8318,35.2010,col="forestgreen",pch=17, cex=1.5)
#C maxima domestication in Argentina
points(-63.67,-31.95,col="orange",pch=17, cex=1.5)
dev.off()

##subsetting by mesophytic and xerophytic 
scinames <- as.vector(unique(noBR_CO_data$scientificname))
mesonames <- c("texana","ozarkana","andreana","sororia","okeechobeensis"
               ,"martinezii","ecuadorensis", "fraterna",
               "lundelliana","hybrida","palmeri","texanum","texanus","maxima","moschata","ficifolia","argyrosperma")
xeronames <- c("cordata","cylindrata","digitata",
               "foetidissima","californica",
               "palmata","pedatifolia","galeotti",
               "perennis","moorei","radicans","scabridifolia")
mesophytic <- noBR_CO_data[grep(paste(mesonames,collapse='|'),noBR_CO_data$scientificname),]
xerophytic <- noBR_CO_data[grep(paste(xeronames,collapse='|'),noBR_CO_data$scientificname),]
map(database="world",regions = new_world,col="cornsilk2",fill=TRUE,bg="lightblue1")
points(mesophytic$decimallongitude, mesophytic$decimallatitude, col = "blue", cex = 0.5, pch=20)
points(xerophytic$decimallongitude, xerophytic$decimallatitude, col = "red", cex = 0.5, pch=20)
dev.off()




