
# project3package

<!-- badges: start -->
[![R-CMD-check](https://github.com/wanyeehing/project3package/workflows/R-CMD-check/badge.svg)](https://github.com/wanyeehing/project3package/actions)
[![codecov](https://codecov.io/gh/wanyeehing/project3package/branch/master/graph/badge.svg?token=MRNDXKUJGL)](https://codecov.io/gh/wanyeehing/project3package)
<!-- badges: end -->

The goal of project3package is to build a package for Project 3.

## Installation

You can install the released version of project3package from GitHub using:

``` r
devtools::install_github("wanyeehing/project3package")
```

## Use

To view vignettes, run the following code:

``` r
devtools::install_github("wanyeehing/project3package", build_vignette = TRUE,
                         build_opts = c())
library(project3package)
# Use this to view the vignette in the project3package HTML help
help(package = "project3package", help_type = "html")
# Use this to view the vignette as an isolated HTML file
utils::browseVignettes(package = "project3package")
```
