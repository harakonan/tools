# CJ_table: Cross join two datatables
# Inputs:
# X, data.table 1
# Y, data.table 2
# Requirement:
# library(data.table)
CJ_table <- function(X,Y) {
  copy(setkey(X[,c(k=1,.SD)],k)[Y[,c(k=1,.SD)],allow.cartesian=TRUE][,k:=NULL])
}