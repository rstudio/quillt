#' Helpers for project setup with quillt
#'
#' These helper are mostly inspired by the one in **usethis** from the tidyverse
#' team and are useful to setup a new pkgdown project with **quillt**
#'
#' @details
#'
#' * `use_coc()`: use `usethis::use_tidy_coc()` and put _CODE\_OF\_CONDUCT.md in
#' `.github/` directory setting the contact email to rstudio's one.
#'
#' @name setup-helpers
NULL

#' @export
#' @rdname setup-helpers
use_coc <- function() {
  check_install("usethis")
  usethis::use_tidy_coc()
}


