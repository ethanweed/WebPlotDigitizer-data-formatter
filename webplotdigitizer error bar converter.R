# converts output from WebPlotDigitizer barplot extraction to csv for meta-analysis
# converts height of error bars measuring SE to SD's


# clear and prepare global environment
rm(list=ls())

library(clipr)
pathin =''
setwd(pathin)

# Webplotdigitizer saves data sets by default as "Default Dataset.csv"
file = 'Default Dataset.csv'
df = read.csv(file, header = FALSE)

# number of participants (needed for calculating SD)
n <- XXX

#get odd rows for means
m <- df$V2[ c(TRUE,FALSE) ]
# get even rows for error bar heights
eb <- df$V2[ !c(TRUE,FALSE) ]

# make new dataframe with means and error bar heights
df <- data.frame(m, eb)

# subtract error bar heights from means to get standard error
se <- df$eb-df$m

# multiply standard error by square root of n to get SD
sd <- se*sqrt(n)

# output results
df <- data.frame(m,sd)
write.csv(file = "output.csv", x = df)
write_clip(df)


