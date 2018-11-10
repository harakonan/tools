# logloss: Function that calculate log loss (deviance)
# Inputs:
# outcome, outputs of test or validation set
# predictor, estimated predictor
# eps, parameter that prevents divergence
# Requirement:
logloss <- function(outcome, predictor, eps = 0.00001) {
  predictor <- pmin(pmax(predictor, eps), 1-eps)
  -1/length(outcome)*(sum(outcome*log(predictor)+(1-outcome)*log(1-predictor)))
}
