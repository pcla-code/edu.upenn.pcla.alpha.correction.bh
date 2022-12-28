#' Calculate Benjamini-Hochberg alphas for a list of p-values.
#' 
#' This function calculates alphas for a list of p-values and for a given false
#' discovery rate (Q). If Q is not provided, a default value of 0.05 is used.
#' The Benjamini-Hochberg alpha corrected is calculated as:
#' alpha=(i/m)Q, where:
#' i = the individual p-value's rank in the list of p-values,
#' m = the total number of tests, and
#' Q = the false discovery rate.
#' The function does not expect the p-values to be sorted but it will return
#' alpha values for the sorted p-values
#' so you are strongly encouraged to sort the p-values before passing them to
#' this function - this will make the returned alpha values more readable.
#' 
#' @param p_values A list of p-values.
#' @param Q the false discovery rate. If not provided, a default value of 0.05
#' is used.
#' @return A list of alpha values or an error message if the provided p-values
#' are not valid.
#' @export
get_alphas <- function(p_values, Q=0.05){
  if(is.null(p_values) || class(p_values) == "NULL" || class(p_values) == "logical" || length(p_values) == 0){
    stop("Invalid p-values.")
  }
  if(Q<0 || Q>1) {
    stop("Invalid Q: ", Q)
  }
  for(p_value in p_values) {
    if(!is.numeric(p_value) || p_value<0 || p_value>1) {
      stop("Invalid p-value: ", p_value)
    }
  }
  sorted_p_values=lapply(p_values, sort)
  alphas=list()
  size <- length(p_values)
  for(i in 1:size){
    alphas=append(alphas, (i/size)*Q)
  }
  return(alphas)
}