#' Copy JS / CSS resources in local pkgdown website
#'
#' This is a helper to retrieve locally some common resources accross pkgdown
#' website. They will be copied from `quillt` package installation to
#' `pkgdown/assets` folder for [website customisation](https://pkgdown.r-lib.org/articles/customise.html#additional-html-and-files).
#'
#' # Example of usage
#'
#' * See [flexdashboard website for usage](https://rstudio.github.io/flexdashboard/articles/using.html)
#'
#'
#' @param snippets Copy the snippets.js script (A custom script offering the
#'   `loadSnippet()` JS function) and the required `ace.js` library in version
#'   1.2.3.
#' @param holder Copy `holder.js` version 2.9.0 <http://holderjs.com/>. Useful
#'   to add placeholder images.
#' @param .overwrite Should it overwrite existing copy ? `TRUE` by default
#'   assuming git tracking is used.
#'
#' @return
#' @examples \dontrun{
#' # do not need holder.js
#' copy_assets(holder = FALSE)
#'
#' # Don't overwrite
#' copy_assets(.overwrite = FALSE)
#' }
#' @export
copy_assets <- function(snippets = TRUE, holder = TRUE, .overwrite = TRUE) {
  assets <- system.file("assets", package = "quillt")

  if (!any(c(snippets, holder))) {
    rlang::inform(c(x = "Nothing to copy"))
    return(invisible(FALSE))
  }

  pkgdown_assets <- "pkgdown/assets"
  fs::dir_create(pkgdown_assets)

  folders <- c(
    if (snippets) c("snippets", "ace-1.2.3"),
    if (holder) c("holder-2.9.0")
  )
  for (f in folders) {
    src <- fs::path(assets, f)
    dest <- fs::path(pkgdown_assets, f)
    fs::dir_copy(src, dest, overwrite = .overwrite)
  }

  rlang::inform(c(v = "Resources copied locally."))
  return(invisible(TRUE))
}
