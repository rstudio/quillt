#' Generate HTML for a 4-wide bootstrap thumbnail
#'
#' @param title Used as title for the link tooltip and as caption is `caption = TRUE`.
#' @param img link to the image to use in the thumbnail.
#' @param href link to use when the image is clicked.
#' @param caption if `FALSE`, only the image will be shown without a caption below.
#' @param source link to a source repository. if `caption = TRUE`, will be added
#'   as a clickable link of the form `(Source)`
#'
#' @export
thumbnail <- function(title, img, href, caption = TRUE, source = NULL) {
  htmltools::div(class = "col-sm-4",
    htmltools::a(class = "thumbnail", title = title, href = href,
        htmltools::img(src = img),
        htmltools::div(class = ifelse(caption, "caption", ""),
            ifelse(caption, title, ""),
            if (caption && !is.null(source)) {
              htmltools::tags$object(
                htmltools::a(class = "source-repo", href = source, "(Source)")
              )
            }
        )
      )
  )
}

#' Generate HTML for several rows of 3-wide bootstrap thumbnails
#'
#' @param thumbs A list of thumbnail HTML components, usually built with `thumbnail()`
#'
#' @export
thumbnails <- function(thumbs) {

  #living since capture arguments and setup rows to return
  numThumbs <- length(thumbs)
  fullRows <- numThumbs / 3
  rows <- htmltools::tagList()

  # add a row of thumbnails
  addRow <- function(first, last) {
    rows <<- htmltools::tagAppendChild(rows, htmltools::div(class = "row", thumbs[first:last]))
  }

  # handle full rows
  for (i in 1:fullRows) {
    last <- i * 3
    first <- last-2
    addRow(first, last)
  }

  # check for leftovers (if numbThumbs < 3, one row is enough)
  leftover <- numThumbs %% 3
  if (numThumbs > 3 && leftover > 0) {
    last <- numThumbs
    first <- last - leftover + 1
    addRow(first, last)
  }

  # return the rows!
  rows
}


#' Generate HTML for examples
#'
#' Used typically in **quillt** website, this will read a YAML file containing
#' the expecting information and build the HTML to be included in the `examples.Rmd` vignette.
#'
#' # YAML structure
#'
#' The YAML should be following this example
#'
#' ```yaml
#' - title: title to use as tooltip and caption # mandatory
#'   href: link to use when the image or caption is clicked # mandatory
#'   img: link to the image to use in thumbnail # mandatory
#'   source: link to the source repo to link to from the caption # optional
#'   showcase: set to FALSE if you want to filter out # optional
#'   shiny: set to TRUE if shiny example # optional
#' ```
#'
#' See existing pkgdown website using **quillt** for examples
#'
#' @param yml Path to the YAML file.
#' @param caption if `FALSE`, the title won't be shown as caption below the image.
#' @param showcaseOnly if `TRUE`, only the element with `showcase: TRUE` in YAML will be shown.
#' @param shinyOnly if `TRUE`, only the element with `shiny: TRUE` in YAML will be shown.
#'
#' @export
examples <- function(yml = "examples.yml", caption = TRUE, showcaseOnly = FALSE, shinyOnly = FALSE) {

  # read examples into data frame (so we can easily sort/filter/etc)
  examples <- yaml::yaml.load_file(yml)
  examples <- plyr::ldply(examples, data.frame, stringsAsFactors=FALSE)

  # filter if requested
  if (showcaseOnly)
    examples <- subset(examples, examples$showcase == TRUE)
  if (shinyOnly)
    examples <- subset(examples, examples$shiny == TRUE)

  # convert to list for thumbnail generation
  examples <- apply(examples, 1, function(r) {
    list(title = r["title"],
         img = r["img"],
         href = r["href"],
         source = if (is.na(r["source"])) NULL else r["source"]
    )
  })

  thumbnails(lapply(examples, function(x) {
    thumbnail(title = x$title,
              img = x$img,
              href = x$href,
              source = x$source,
              caption = caption)
  }))
}
