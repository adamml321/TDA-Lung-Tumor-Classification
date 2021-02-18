#This script will pick a representative slice from each segmentation and format it for the cubical complex pipeline
#We do this by normalizing the values and saving as a numpy file. 

library(reticulate)

radiogenomics.segments = readRDS('radiogenomics.segments.rds')

radg.clinical = read.csv("radg_clinic.csv")
radg.names = radg.clinical$Case.ID
R01.names = radg.names[50:195]
R01.names = R01.names[-c(9, 143)]

length(radiogenomics.segments)
length(R01.names)
R01.names

np = import("numpy")

for (i in 1:length(radiogenomics.segments)) {
  file.name <- paste("./Radiogenomics_Arrays/", R01.names[i], ".npy", sep = "")
  
  print(file.name)
  np$save(file.name, r_to_py(radiogenomics.segments[[i]]))
}

