# tidy_num: Function that shape numeric values tidy
# Inputs:
# x, numeric
# a, digits before the decimal point 
# b, digits after the decimal point 
# Requirement:
# NULL
trunc_digits <- function(x, ..., digits = 0) trunc(x*10^digits, ...)/10^digits
tidy_num <- function(x, a, b) sprintf(paste0("%",a,".",b,"f"),trunc_digits(x, digits = b))
