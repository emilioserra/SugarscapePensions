# Copyright 2019 Emilio Serrano and Ken Satoh.
# 
# This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 License. To view a copy of this license, visit https://creativecommons.org/licenses/by-nc-sa/3.0/ or send a letter to Creative Commons, 559 Nathan Abbott Way, Stanford, California 94305, USA.
# Commercial licenses are also available. To inquire about commercial licenses, please contact Emilio Serrano at https://emilioserra.oeg-upm.net/
#   
  
  

#FILES INFO
input= "./e1.csv"  #extra info before head has to be removed
output ="./e1aggregated.xlsx"


#PREPROCESSING DATA
df = read.csv(input)  # read csv file 
df = df[,9:length(df) ] #remove parameters that does not changd
df <- df[-5] # remove column with ticks wich is always 1000 
#column names: initial population, retirament age, pension taxes, fixed fee, piggy bank, gdp, gini index social exclusion in working working agents, social exclusion in retired agents, sum of social exclusion 
names(df)<- c("ip", "ra", "pt", "ff", "pb", "gdp", "gin", "sew", "ser", "ses")


#AGGREGATING DATA
#some doc here https://www.r-bloggers.com/how-to-aggregate-data-in-r/agg
#mean
agg1 = aggregate(df,  by = list(df$ip, df$ra, df$pt, df$ff ), FUN = mean)
#standar deviation
agg2 = aggregate(df,  by = list(df$ip, df$ra, df$pt, df$ff ), FUN = sd)
nr = nrow(agg2) #number of experiments/runs for each configuration. 
#debuggin note, check that nr matches the netlogo runs for each combination of parameters
# standar error
agg3 =  agg2 / sqrt(nr) 
#final agg
names(agg1)
agg = cbind(agg1[,5:length(agg1)], agg2[,9:length(agg2)],  agg3[,9:length(agg3)] )
agg= round(agg,2)
names(agg)<- c("ip", "ra", "pt", "ff", "pb", "gdp", "gin", "sew", "ser", "ses", "sd_pb", "sd_gdp", "sd_gin", "sd_sew", "sd_ser", "sd_ses", "se_pb", "se_gdp", "se_gin", "se_sew", "se_ser", "se_ses" )

#SHOWING BEST RESULTS
print("--------Best results considering gini index--------")
print(head(agg[order(agg$gin),]))
print("--------Best results considering social exclusion--------")
print(head(agg[order(agg$ses),]))
print("--------Best results considering social exclusion in retirees--------")
print(head(agg[order(agg$ser),]))


#EXPORTING
library(xlsx)
write.xlsx(agg, output)