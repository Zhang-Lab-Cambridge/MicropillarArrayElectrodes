install.packages("readxl")
install.packages("corrplot")

library(readxl)
library(corrplot)

#Data Import
MicroPillar_MeanVariablesNo800 <- read_excel("D:/Josh/Documents/BBSRC PhD/Publications/XL Electrode Design Paper/Fig 5b.xlsx")

#Correlation Processing
VariableMeanCorrNo800 <- cor(MicroPillar_MeanVariablesNo800)
VariableMeanCorrUnloadedNo800 <- cor(MicroPillar_MeanVariablesNo800[,-(7:9)])
VariableMeanCorrLoadedNo800 <- cor(MicroPillar_MeanVariablesNo800[,-(4:6)])

#Confidence Intervals (0.95)
VariableMeanpvaluesNo800 <- cor.mtest(MicroPillar_MeanVariablesNo800, conf.level = 0.95)
VariableMeanUnloadedpvaluesNo800 <- cor.mtest(MicroPillar_MeanVariablesNo800[,-(7:9)], conf.level = 0.95)
VariableMeanLoadedpvaluesNo800 <- cor.mtest(MicroPillar_MeanVariablesNo800[,-(4:6)], conf.level = 0.95)

#Corrplots with significance

tiff(height=6000, width=6000, file="D:/Josh/Documents/BBSRC PhD/Publications/XL Electrode Design Paper/Fig S15.tiff",res=600)
VariableMeanCorrPlotNo800 <- corrplot(VariableMeanCorrNo800, p.mat = VariableMeanpvaluesNo800$p, insig = "label_sig", sig.level = c(.01, .05, .1), pch.cex = .9, pch.col = "white", type="upper", tl.col="black", tl.srt=45)
dev.off()

tiff(height=6000, width=6000, file="D:/Josh/Documents/BBSRC PhD/Publications/XL Electrode Design Paper/Fig 5b.tiff",res=600)
VariableMeanCorrUnloadedPlotNo800 <- corrplot(VariableMeanCorrUnloadedNo800, p.mat = VariableMeanUnloadedpvaluesNo800$p, insig = "label_sig", sig.level = c(.01, .05, .1), pch.cex = .9, pch.col = "white",type="upper", tl.col="black", tl.srt=45)
dev.off()