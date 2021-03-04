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
  check_installed("usethis")
  usethis::use_tidy_coc()
}

#' @export
#' @rdname setup-helpers
use_contributing <- function() {
  check_installed("usethis")
  usethis:::use_dot_github()
  data <- list(Package = usethis:::project_name())
  use_template("CONTRIBUTING.md",
               file.path(".github", "CONTRIBUTING.md"),
               data = data)
}

#' @export
#' @rdname setup-helpers
use_github_action_quillt_pkgdown <- function() {
  check_installed("usethis")
  usethis:::use_dot_github()
  template <- usethis:::find_template("pkgdown-gha.yaml", package = "quillt")
  usethis::use_github_action(url = template, save_as = "pkgdown.yaml", ignore = TRUE, open = FALSE)
  usethis::ui_todo("Check deployment action configuration, specifically main deploy branch.")
  usethis::ui_todo("Set Github Secrets for Netlify deployment:")
  usethis::ui_line("   - NETLIFY_AUTH_TOKEN")
  usethis::ui_line("   - NETLIFY_SITE_ID")
}

#' @export
#' @param config_file Path to the pkgdown yaml config file - could be set to be
#'   `pkgdown/` subfolder.
#' @param destdir Target directory for pkgdown docs. By default, it will be in
#'   `reference` sub directory for R Markdown related package using **quillt**.
#' @rdname setup-helpers
use_quillt_pkgdown <- function(config_file = "_pkgdown.yml", destdir = "reference") {
  check_installed("usethis")
  usethis::ui_info("Creating assets for using quillt templated pkgdown website.")
  # Create destdir if it does not exist
  usethis::use_directory(destdir)

  # Add pkgdown config to use with quillt
  usethis::ui_info("Adding pkgdown config for quillt-like project.")
  data <- list(Package = usethis:::project_name(),
               destdir = destdir,
               github_url = usethis:::github_url())
  use_template("pkgdown-config.yaml", "_pkgdown.yml", data = data)
  usethis::use_build_ignore(c(config_file, destdir, "pkgdown"))
  usethis::use_git_ignore(destdir)

  # Add folder for articles
  usethis::ui_info("Adding articles subdir in 'vignettes/' folder.")
  articles_dir <- "vignettes/articles"
  usethis::use_directory(articles_dir)
  usethis::use_build_ignore(articles_dir)

  # Add example article
  usethis::ui_info("Adding article for Examples section.")
  use_template("articles-examples.Rmd",
               file.path(articles_dir, "examples.Rmd"),
               data = data, ignore = FALSE, open = FALSE)
  use_template("articles-examples.yaml",
               yml_ex <- file.path(articles_dir, "examples.yml"),
               data = list(), ignore = FALSE, open = FALSE)

  # Add vignette used as Get Started.
  usethis::ui_info("Adding package named vignette for Get Started section.")
  use_template("vignette-intro.Rmd",
               intro_rmd <- file.path("vignettes", paste0(data$Package, ".Rmd")),
               data = data, ignore = FALSE, open = FALSE)

  # Add Code Of Conduct and Contributing
  usethis::ui_info("Adding more assets if missing")
  use_coc()
  use_contributing()

  # TODOS
  usethis::ui_info("What is left to be done ?")
  usethis::ui_todo("Add a logo in {usethis::ui_field('man/figures/logo.png')}. \\
                   with {usethis::ui_code('usethis::use_logo()')}.")
  usethis::ui_todo("Check and adapt configuration in {usethis::ui_field(config_file)}.")
  usethis::ui_todo("Add examples to {usethis::ui_field(yml_ex) } for the Examples article")
  usethis::ui_todo("Add learning resources to  {usethis::ui_field(intro_rmd)} for the Get Started section.")
  usethis::ui_todo("Add github action workflow with {usethis::ui_code('quillt::use_github_action_quillt_pkgdown()')}")
}

use_template <- function(...) {
  usethis::use_template(..., package = "quillt")
}
