library(AppliedPredictiveModeling)
transparentTheme(trans = .4)
library(caret)

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")


input <- function(inputfile) {
	pfix = prefix()
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
   # Need to get the three files
   csvfile <<- paste(pfix, parameters["csvfile", 2], sep="/")

   myData <<- read.csv(csvfile)
   myPct <<- as.numeric(parameters["pct", 2])
}

run <- function() {}

output <- function(outputfile) {
library(caret)
set.seed(3456)
trainIndex <- createDataPartition(myData$Species, p = myPct, 
                                  list = FALSE, 
                                  times = 1)

write.csv(myData[trainIndex,], paste(outputfile, "train", "csv", sep="."))
write.csv(myData[-trainIndex,], paste(outputfile, "test", "csv", sep="."))

}
