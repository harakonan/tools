# set_na_0: Function that fill NA with 0 for the entire or selected columns of a data.table
# Inputs:
# DT, data.table
# cols, selected column names
# cols can be left unspecified if the target is the entire data.table
# Requirement:
# library(data.table)
set_na_0 <- function(DT, cols = NULL) {
	if (length(cols) == 0){
		for (j in seq_len(ncol(DT))){
			set(DT,which(is.na(DT[[j]])),j,0)
		}
	} else {
		for (col in cols){
			set(DT,which(is.na(DT[[col]])),col,0)
		}
	}
}