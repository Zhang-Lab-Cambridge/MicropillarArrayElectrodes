install.packages("readxl")
install.packages("corrplot")

library(readxl)
library(corrplot)


#Data Import
MicroPillar_MeanVariables <- read_excel("MicroPillar_MeanVariables.xlsx")

#Correlation Processing
VariableMeanCorr <- cor(MicroPillar_MeanVariables)
VariableMeanCorrUnloaded <- cor(MicroPillar_MeanVariables[,-(7:9)])

#Confidence Intervals (0.95)
VariableMeanpvalues <- cor.mtest(MicroPillar_MeanVariables, conf.level = 0.95)
VariableMeanUnloadedpvalues <- cor.mtest(MicroPillar_MeanVariables[,-(7:9)], conf.level = 0.95)

#Corrplots
tiff(height=6000, width=6000, file="VariableMeanCorrPlot.tiff",res=600)
VariableMeanCorrPlot <- corrplot(VariableMeanCorr,type="upper", tl.col="black", tl.srt=45)
dev.off()

tiff(height=6000, width=6000, file="VariableMeanCorrPlotUnloadedOnly.tiff",res=600)
VariableMeanCorrUnloadedPlot <- corrplot(VariableMeanCorrUnloaded,type="upper", tl.col="black", tl.srt=45)
dev.off()

#Corrplots with significance

tiff(height=6000, width=6000, file="VariableMeanCorrPlotWithPvalues.tiff",res=600)
VariableMeanCorrPlot <- corrplot(VariableMeanCorr, p.mat = VariableMeanpvalues$p, insig = "label_sig", sig.level = c(.01, .05, .1), pch.cex = .9, pch.col = "white", type="upper", tl.col="black", tl.srt=45)
dev.off()

tiff(height=6000, width=6000, file="VariableMeanCorrPlotUnloadedOnlyWithPvalues.tiff",res=600)
VariableMeanCorrUnloadedPlot <- corrplot(VariableMeanCorrUnloaded, p.mat = VariableMeanUnloadedpvalues$p, insig = "label_sig", sig.level = c(.01, .05, .1), pch.cex = .9, pch.col = "white",type="upper", tl.col="black", tl.srt=45)
dev.off()