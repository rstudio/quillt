#' Helpers for project setup with quillt
#'
#' These helper are mostly inspired by the one in **usethis** from the tidyverse
#' team and are useful to setup a new pkgdown project with **quillt**
#'
#' @details
#'
#' + `use_coc()`: use `usethis::use_tidy_coc()` and put _CODE\_OF\_CONDUCT.md_ in
#' `.github/` directory setting the contact email to Rstudio one.
#'
#' + `use_contributing`: Add a _CONTRIBUTING.md_ file in `.github/` following a
#' template in **quillt**. Inspired by `usethis::use_tidy_contributing()`.
#'
#' @name setup-helpers
NULL

#' @export
#' @rdname setup-helpers
use_coc <- function() {
  check_install("usethis")
  usethis::use_tidy_coc()
}

#' @export
#' @rdname setup-helpers
use_contributing <- function() {
  check_install("usethis")
  usethis:::use_dot_github()
  data <- list(Package = usethis:::project_name())
  usethis::use_template("CONTRIBUTING.md",
                        file.path(".github", "CONTRIBUTING.md"),
                        data = data, package = "quillt")
}

