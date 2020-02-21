#Author Dr. S. Ravichandran
# prepared for BIFX-550 Sequence Alignment-1

# data from UniProt/SwissProt release 2018_08 statistics

# uncomment to install just ggplot2, if you need to install ggplot2
# install.packages("ggplot2")
# after installing comment the above line to avoid installing again
library(ggplot2)


aa <- c(
  "A","Q","L","S",
  "R","E","K","T",
  "N","G","M","W",
  "D","H","F","Y",
  "C","I","P","V"
  )

comp <- c(
  8.25,3.93,9.65,6.62,
  5.53,6.73,5.81,5.35,
  4.05,7.07,2.41,1.09,
  5.46,2.27,3.86,2.91,
  1.38,5.92,4.73,6.86
  )

scomp <- comp
scomp 
names(scomp) <- aa 
scomp <- sort(scomp)
scomp
 
barplot(scomp, names.arg = names(scomp), xlab = "Amino acids", 
        ylab = "Frequency", main = "Data from SwissProt", col = "green")

comp1 <- names(comp)
df <- data.frame(comp=comp)
library(ggplot2)
library(tidyverse)

df %>% ggplot(aes(x = reorder(aa,comp), y = comp, fill = aa)) +
  geom_bar(stat="identity") +
  theme_minimal()

