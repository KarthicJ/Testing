install.packages("shiny")
install.packages("sqldf")
install.packages("plyr")
install.packages("tcltk2")
library(shiny)
library(sqldf)
library(plyr)
library(tcltk2)



data_po <- read.csv("C:/PROJECT/data_po/data_po.csv")


View(data_po)

data_po$Timediff <- as.numeric(difftime(data_po$Complete.Timestamp,data_po$Start.Timestamp,units="hours"))

Rolebased <- sqldf("select Role,sum(Timediff) as Duration,count(Role) as Frequency from data_po group by Role")

num <- sqldf("select sum(Frequency) from Rolebased")
num <- sum(Rolebased$Frequency)
freq <- Rolebased$Frequency


Rolebased$Frequency_Percentage <- freq/num

View(Rolebased)
write.csv(Rolebased, file = "C:/PROJECT/data_po/Rolebased.csv")

data_po$Timediff <- as.numeric(difftime(data_po$Complete.Timestamp,data_po$Start.Timestamp,units="hours"))

Emp_based <- sqldf("select Resource, sum(Timediff) as Duration,count(Resource) as Frequency from data_po group by Resource")

#num1 <- sqldf("select sum(Frequency) from Emp_based")
num1 <- sum(Emp_based$Frequency)
freq1 <- Emp_based$Frequency


Emp_based$Frequency_Percentage <- freq1/num1

View(Emp_based)
write.csv(Emp_based, file = "C:/PROJECT/data_po/Emp_based.csv")

data_po$Timediff <- as.numeric(difftime(data_po$Complete.Timestamp,data_po$Start.Timestamp,units="hours"))

Activity_based <- sqldf("select Activity, sum(Timediff) as Duration,count(Activity) as Frequency from data_po group by Activity")

#num1 <- sqldf("select sum(Frequency) from Emp_based")
num2 <- sum(Activity_based$Frequency)
freq2 <- Activity_based$Frequency


Activity_based$Frequency_Percentage <- freq2/num2

View(Activity_based)
write.csv(Activity_based, file = "C:/PROJECT/data_po/Activity_based.csv")

CaseID_based <- sqldf("select CaseID, sum(Timediff) as Duration,count(Activity) as Events from data_po group by CaseID")

num3 <- sum(CaseID_based$Events)
freq3 <- CaseID_based$Events


CaseID_based$Frequency_Percentage <- freq3/num3
View(CaseID_based)
write.csv(CaseID_based, file = "C:/PROJECT/data_po/CaseID_based.csv")

data_scm <- read.csv("C:/PROJECT/data_po/data_scm.csv")

View(data_scm)

data_scm$Timediff <- as.numeric(difftime(data_scm$Complete.Timestamp,data_scm$Start.Timestamp,units="hours"))

Inventorybased <- sqldf("select Inventory,sum(Timediff) as Duration,count(Inventory) as Inv_frequency from data_scm group by Inventory")

Inv_num <- sum(Inventorybased$Inv_frequency)
Inv_freq <- Inventorybased$Inv_frequency

Inventorybased$Inv_frequency_Percentage <- Inv_freq/Inv_num

View(Inventorybased)
write.csv(Inventorybased, file = "C:/PROJECT/data_po/Inventorybased.csv")


data_scm$Timediff <- as.numeric(difftime(data_scm$Complete.Timestamp,data_scm$Start.Timestamp,units="hours"))

Inv_Res_based <- sqldf("select Resource, sum(Timediff) as Duration,count(Resource) as Inv_frequency from data_scm group by Resource")

Inv_num1 <- sum(Inv_Res_based$Inv_frequency)
Inv_freq1 <- Inv_Res_based$Inv_frequency


Inv_Res_based$Inv_frequency_Percentage <- Inv_freq1/Inv_num1

View(Inv_Res_based)
write.csv(Inv_Res_based, file = "C:/PROJECT/data_po/Inv_Res_based.csv")

data_scm$Timediff <- as.numeric(difftime(data_scm$Complete.Timestamp,data_scm$Start.Timestamp,units="hours"))

Inv_Activity_based <- sqldf("select Activity, sum(Timediff) as Duration,count(Activity) as Inv_frequency from data_scm group by Activity")

Inv_num2 <- sum(Inv_Activity_based$Inv_frequency)
Inv_freq2 <- Inv_Activity_based$Inv_frequency


Inv_Activity_based$Inv_frequency_Percentage <- Inv_freq2/Inv_num2

View(Inv_Activity_based)
write.csv(Inv_Activity_based, file = "C:/PROJECT/data_po/Inv_Activity_based.csv")

data_scm$Timediff <- as.numeric(difftime(data_scm$Complete.Timestamp,data_scm$Start.Timestamp,units="hours"))
Inv_CaseID_based <- sqldf("select CaseID, sum(Timediff) as Duration,count(Activity) as Events from data_scm group by CaseID")

Inv_num3 <- sum(Inv_CaseID_based$Events)
Inv_freq3 <- Inv_CaseID_based$Events


Inv_CaseID_based$Inv_frequency_Percentage <- Inv_freq3/Inv_num3
View(Inv_CaseID_based)
write.csv(Inv_CaseID_based, file = "C:/PROJECT/data_po/Inv_CaseID_based.csv")
