#------------------------------------------------------
# Program name: rarefraction.R
# Objective: Code for rarefraction from Isoseq   
#          full length counts
# Author: Lloyd
# Email add: lloydlow@hotmail.com
#------------------------------------------------------

library(tidyverse)
library(data.table)

#Brahman pre-SQANTI 
dir1 <- "/Users/kellydren/Documents/Kelly_2021/Research/Lloyd_PacBio_ILMN_quantification/Raw_data/map_to_brahman/post-SQANTI-filter/"

classification <- read.delim(paste0(dir1,"hq.5merge.collapsed_classification.filtered_lite_classification.txt"),
                             stringsAsFactors = FALSE)

table(classification$exons)

#remove single exons transcripts
classification[classification$exons == 1,]

classification[classification$associated_transcript == "novel",]

table(classification$structural_category)

#pure brahman
summary(classification$FL.F22)
summary(classification$FL.F99)
summary(classification$FL.F65)

#pure angus
summary(classification$FL.F53)
summary(classification$FL.F60)
summary(classification$FL.F77)

#Remove unwanted variables
classification.keep <- classification %>% 
  dplyr::select(isoform,associated_gene,structural_category,exons,FL.F22,FL.F99,FL.F65,FL.F53,FL.F60,FL.F77)

#remove single exons transcripts
classification.keep <- classification.keep %>% filter(exons != 1)

######

#prepare sample F22
classification.keep.F22 <- classification.keep %>% 
  dplyr::select(isoform,associated_gene,structural_category,FL.F77) %>%
  filter(FL.F77 != 0)

# #loop through each sample DF and expand the isoforms according to FL count
# vec.F22 <- c()
# 
# for (i in 1:nrow(classification.keep.F22)){
#   dummy <- rep(classification.keep.F22$isoform[i],classification.keep.F22$FL.F77[i])
#   vec.F22 <- c(vec.F22,dummy)
# }

#isoform level
classification.keep.F22.iso <- setDT(classification.keep.F22)[,.(z = 1:FL.F77), by = .(isoform)]
classification.keep.F22.iso$selc <- 1:nrow(classification.keep.F22.iso)

# sample.int(nrow(classification.keep.F22.iso), 1000, replace = FALSE)

#total number of isoforms
length(unique(classification.keep.F22.iso$isoform))

looper.isoform <- seq(1,nrow(classification.keep.F22.iso),by=50000)

no_of_isoform <- c()

set.seed(1111)

for (i in seq(1,nrow(classification.keep.F22.iso),by=50000)){
  chosen <- sample.int(nrow(classification.keep.F22.iso), i, replace = FALSE)
  df <- classification.keep.F22.iso[chosen,]
  subsampled_isoform_number <- length(unique(df$isoform))
  no_of_isoform <- c(no_of_isoform,subsampled_isoform_number)
}

plot(looper.isoform,no_of_isoform, type = "l")

#gene level, merge same gene name and combine count
length(unique(classification.keep.F22$associated_gene))

classification.keep.F22.gene <- classification.keep.F22 %>% 
  group_by(associated_gene) %>% 
  summarise(sum_count = sum(FL.F77))

classification.keep.F22.gene.expanded <- 
  setDT(classification.keep.F22.gene)[,.(z = 1:sum_count), by = .(associated_gene)]

classification.keep.F22.gene.expanded$selc <- 1:nrow(classification.keep.F22.gene.expanded)

looper.gene <- seq(1,nrow(classification.keep.F22.gene.expanded),by=50000)

no_of_gene <- c()

set.seed(1111)

for (i in seq(1,nrow(classification.keep.F22.gene.expanded),by=50000)){
  chosen <- sample.int(nrow(classification.keep.F22.gene.expanded), i, replace = FALSE)
  df <- classification.keep.F22.gene.expanded[chosen,]
  subsampled_gene_number <- length(unique(df$associated_gene))
  no_of_gene <- c(no_of_gene,subsampled_gene_number)
}

plot(looper.gene,no_of_gene, type = "l")


# Combined rarefraction curve

rarefraction_data <- data.frame(looper=looper.gene,
                                number=no_of_gene,
                                type="gene")%>%
  rbind(data.frame(looper=looper.isoform,
                   number=no_of_isoform,
                   type="isoform"))

ggplot()+
  geom_line(data = rarefraction_data, aes(x=looper, y= as.numeric(number), group = type, color = type)) +
  theme(axis.text.y = element_blank())+
  theme_bw() +
  scale_color_manual(name=NULL,
                     values=c("red3","royalblue3"))+
  labs(x = "looper", y = "Number of features") 

#rarefraction_data_F22 <- rarefraction_data
#rarefraction_data_F22$Sample <- "F22"

#rarefraction_data_F99 <- rarefraction_data
#rarefraction_data_F99$Sample <- "F99"

#rarefraction_data_F65 <- rarefraction_data
#rarefraction_data_F65$Sample <- "F65"

#rarefraction_data_F53 <- rarefraction_data
#rarefraction_data_F53$Sample <- "F53"

#rarefraction_data_F60 <- rarefraction_data
#rarefraction_data_F60$Sample <- "F60"

rarefraction_data_F7 <- rarefraction_data
rarefraction_data_F7$Sample <- "F7"

all_rarefraction_data <- rbind(rarefraction_data_F22,rarefraction_data_F99) %>%
  rbind(rarefraction_data_F65) %>%
  rbind(rarefraction_data_F53) %>% 
  rbind(rarefraction_data_F60) %>% 
  rbind(rarefraction_data_F7)



all_rarefraction_data <- readRDS("all_rarefraction_data.rds")
#all_rarefraction_data <- rbind(all_rarefraction_data,rarefraction_data)
#saveRDS(all_rarefraction_data, "all_rarefraction_data.rds")

all_rarefraction_data$type.Sample <- paste0(all_rarefraction_data$type,"_",all_rarefraction_data$Sample)

ggplot()+
  geom_line(data = all_rarefraction_data%>%subset(type %in% "gene"), aes(x=looper, y= as.numeric(number),  group = type.Sample, color = Sample)) +
  theme(axis.text.y = element_blank())+
  theme_bw() +
  scale_color_manual(name=NULL,
                     values=c("red3","royalblue3","green", "pink","grey","black"))+
  labs(x = "Number of subsampled transcripts", y = "Number of genes") 


