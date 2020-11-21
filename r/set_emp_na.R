# set_emp_na: Function that fill empty character with NA for the entire or selected columns of a data.table
# Inputs:
# DT, data.table
# cols, selected column names
# cols can be left unspecified if the target is the entire data.table
# Requirement:
# library(data.table)
set_emp_na <- function(DT, cols = NULL) {
	if (length(cols) == 0){
		for (j in seq_len(ncol(DT))){
			set(DT,which(DT[[j]] == ""),j,NA)
		}
	} else {
		for (col in cols){
			set(DT,which(DT[[col]] == ""),col,NA)
		}
	}
}