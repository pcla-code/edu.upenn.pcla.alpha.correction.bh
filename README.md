# Alpha Correction R Package

### `library(edu.upenn.pcla.alpha.correction)`

## Introduction
This package provides functions for calculating alpha corrections for a list of p-values according to the _Benjamini-Hochberg_ alpha correction.

For a sorted list containing _m_ p-values indexed from  _1_ to _m_, the alpha for each p-value _p_ is computed as:

                          alpha(i) = (p_value(i)/m)Q
where:

- _i_ is the index of the p-value in list _l_ (1 to m),
- _p_value(i)_ is the p_value at index i, and 
- Q is the false discovery rate, which is 0.05 by default.

## Installation

Install the package using dev tools directly from github.

`devtools::install_github('pcla-code/edu.upenn.pcla.alpha.correction')`

## Usage

`get_alphas(p_values, Q)`

Use this function to calculate corrected values for a list of p-values and a given false discovery rate Q.

If you do not provide Q, a default value of 0.05 will be used.

The function will sort the list of p-values, but you are encouraged to pass a sorted list nonetheless, so you can readily compare the p-values your passed to the returned alphas.

### Example 1:
`get_alphas(list(0.01,0.08,0.039))`

_Output:_

[[1]] [1] 0.01666667

[[2]] [1] 0.03333333

[[3]] [1] 0.05


### Example 2:
`get_alphas(list(0.01,0.08,0.039), .07)`

_Output:_

[[1]] [1] 0.02333333

[[2]] [1] 0.04666667

[[3]] [1] 0.07

