#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
install.packages("devtools")
devtools::install_github("JViewLLC/R_DSWbContainer", auth_token = "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", ref = "main")
library(DSWbContainer)
library(RODBC)
conn <- odbcConnect(paste("PRTS", "; Trusted_Connection=", "Yes", sep = ""))
wellbore_container <- Wellbore_Container$new()
wellbore_container$loadFromSQLById(conn, "261AAD97-977C-4C9C-8CE4-9ED577816BBC")

wellbore_container$Wells
wellbore_container$logCurveInfos
wellbore_container$Log_App_Datas
wellbore_container$DistinctLog_Table_Mappings
wellbore_container$Wellbore_Container_Curve_Mapping

wellbore_container$findMnemonicsByDescriptionAndKeyword("bit")

mnemonics<- c("BLOCK_POS", "BIT_DEPTH", "AVG_ROP_FT_HR", "TOT_DPT_MD", "FLOW_IN", "TD_SPEED", "WOB", "HOOKLOAD_MAX", "STP_PRS_1", "TD_TORQUE", "FLOW_OUT_REL", "GAINLOSS")
startIndex <-"2022-11-10T21:11:00.000Z"
endIndex <- "2022-11-11T21:11:00.000Z"
wellbore_container$getTableData(conn, mnemonics, 1, "2022-11-10T21:11:00.000Z", "2022-11-11T21:11:00.000Z")
df <- wellbore_container$timeData
df
library(ggplot2)
ggplot(df,aes(BIT_DEPTH)) +geom_histogram()







length
wellbore_container$timeMin
wellbore_container$timeMax
#create a new column with basic math:
df$bit_distance_from_bottom <- df$TOT_DPT_MD - df$BIT_DEPTH
#create a new column with a lagged calculation
df$holeDepthChangeSinceLastRow <- c(5, diff(df$TOT_DPT_MD))
#research and play with:
?diff()
#  It will give the difference between the two elements
#EG
#a <- c(5,10,20,35)
#diff(a)
diff(df$DateTime)
#light research on summary function
# This function will summariz the element gives (min,median,mean,max)
summary(df)
?summary()
#research correlation:
# it gives the corelation between the two variable , thw relation between the variable
# EG
#x <- c(1,2,3,4,5)
#y <- c(6,7,8,9,10)
cor(x,y)
cor(df$TD_TORQUE, df$TD_SPEED)
?cor()
#figure out how to delete this column from DF after adding it:
df$random <- df$GAINLOSS * df$WOB
#How do I remove a column from a dataframe
#Method 1 to delet the created colum in data frame
df1<- df[,-16]
df1
#Method to delet the colum in original data fram
df$random = NULL

df2 <- subset(df, select = -random)

3**4


"hello world"
