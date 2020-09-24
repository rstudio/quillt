#' Test function
#'
#' @section Heading 1:
#'
#' Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
#' tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
#' quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
#' consequat. Duis aute irure dolor in reprehenderit in voluptate velit
#' esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
#' cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id
#' est laborum.
#'
#' Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
#' tempor incididunt ut labore et dolore magna aliqua. Turpis massa tincidunt
#' dui ut ornare lectus. In est ante in nibh. Eu sem integer vitae justo eget.
#' Massa placerat duis ultricies lacus sed turpis. Etiam sit amet nisl purus
#' in mollis nunc sed id. Porta non pulvinar neque laoreet suspendisse interdum
#' consectetur. Risus at ultrices mi tempus imperdiet nulla malesuada
#' pellentesque.
#'
#' ## Heading 2a
#'
#' Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
#' tempor incididunt ut labore et dolore magna aliqua. Turpis massa tincidunt
#' dui ut ornare lectus. In est ante in nibh. Eu sem integer vitae justo eget.
#' Massa placerat duis ultricies lacus sed turpis. Etiam sit amet nisl purus
#' in mollis nunc sed id. Porta non pulvinar neque laoreet suspendisse interdum
#' consectetur. Risus at ultrices mi tempus imperdiet nulla malesuada
#' pellentesque.
#'
#' Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
#' tempor incididunt ut labore et dolore magna aliqua. Turpis massa tincidunt
#' dui ut ornare lectus. In est ante in nibh. Eu sem integer vitae justo eget.
#' Massa placerat duis ultricies lacus sed turpis. Etiam sit amet nisl purus
#' in mollis nunc sed id. Porta non pulvinar neque laoreet suspendisse interdum
#' consectetur. Risus at ultrices mi tempus imperdiet nulla malesuada
#' pellentesque.
#'
#' Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
#' tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
#' quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
#' consequat. Duis aute irure dolor in reprehenderit in voluptate velit
#' esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
#' cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id
#' est laborum.
#'
#' ## Heading 2b
#'
#' Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
#' tempor incididunt ut labore et dolore magna aliqua. Turpis massa tincidunt
#' dui ut ornare lectus. In est ante in nibh. Eu sem integer vitae justo eget.
#' Massa placerat duis ultricies lacus sed turpis. Etiam sit amet nisl purus
#' in mollis nunc sed id. Porta non pulvinar neque laoreet suspendisse interdum
#' consectetur. Risus at ultrices mi tempus imperdiet nulla malesuada
#' pellentesque.
#'
#' Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
#' tempor incididunt ut labore et dolore magna aliqua. Turpis massa tincidunt
#' dui ut ornare lectus. In est ante in nibh. Eu sem integer vitae justo eget.
#' Massa placerat duis ultricies lacus sed turpis. Etiam sit amet nisl purus
#' in mollis nunc sed id. Porta non pulvinar neque laoreet suspendisse interdum
#' consectetur. Risus at ultrices mi tempus imperdiet nulla malesuada
#' pellentesque.
#'
#' Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
#' tempor incididunt ut labore et dolore magna aliqua. Turpis massa tincidunt
#' dui ut ornare lectus. In est ante in nibh. Eu sem integer vitae justo eget.
#' Massa placerat duis ultricies lacus sed turpis. Etiam sit amet nisl purus
#' in mollis nunc sed id. Porta non pulvinar neque laoreet suspendisse interdum
#' consectetur. Risus at ultrices mi tempus imperdiet nulla malesuada
#' pellentesque.
#'
#' Generate HTML for a 4-wide bootstrap thumbnail
#'
#' @export
thumbnail <- function(title, img, href, caption = TRUE) {
  htmltools::div(class = "col-sm-4",
    htmltools::a(class = "thumbnail", title = title, href = href,
        htmltools::img(src = img),
        htmltools::div(class = ifelse(caption, "caption", ""),
            ifelse(caption, title, "")
        )
      )
  )
}

#' Generate HTML for several rows of 3-wide bootstrap thumbnails
#'
#' @export
thumbnails <- function(thumbs) {

  # capture arguments and setup rows to return
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

  # check for leftovers
  leftover <- numThumbs %% 3
  if (leftover > 0) {
    last <- numThumbs
    first <- last - leftover + 1
    addRow(first, last)
  }

  # return the rows!
  rows
}


#' Generate HTML for examples
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
         href = r["href"])
  })

  thumbnails(lapply(examples, function(x) {
    thumbnail(title = x$title,
              img = x$img,
              href = x$href,
              caption = caption)
  }))
}
