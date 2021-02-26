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
#' + `use_github_action_quillt_pkgdown`: Set a Github Action workflow to build a
#' pkgdown website and deploy to Netlify. The deployment action use allow a main
#' deploy branch and PR previews. This action will be triggered on PR only for
#' branch targetting master and with a name starting with `pkgdown/`
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

#' @export
#' @rdname setup-helpers
use_github_action_quillt_pkgdown <- function(main_branch = "master") {
  check_install("usethis")
  usethis:::use_dot_github()
  template <- usethis:::find_template("pkgdown.yaml", package = "quillt")
  usethis::use_github_action("pkgdown.yaml", template, basename(template), ignore = TRUE, open = FALSE)
  usethis::ui_todo("Set Github Secrets for Netlify deployment:")
  usethis::ui_line("   - NETLIFY_AUTH_TOKEN")
  usethis::ui_line("   - NETLIFY_SITE_ID")
  usethis::ui_todo("Check deployment action configuration")
}

