
<!-- README.md is generated from README.Rmd. Please edit that file -->

# aqua

<!-- badges: start -->
<!-- badges: end -->

The goal of aqua is to provide useful functions for SLU Aqua

## Installation

You can install the development version of aqua from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("SLU-marten/aqua")
```

## Example open_in_excel

This is a basic example which shows you how to solve a common problem:

``` r
library(aqua)
iris |> head() |> open_in_excel()
#>   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#> 1          5.1         3.5          1.4         0.2  setosa
#> 2          4.9         3.0          1.4         0.2  setosa
#> 3          4.7         3.2          1.3         0.2  setosa
#> 4          4.6         3.1          1.5         0.2  setosa
#> 5          5.0         3.6          1.4         0.2  setosa
#> 6          5.4         3.9          1.7         0.4  setosa
```
