test_that("create a thumbnail with provided information", {
  expect_snapshot(thumbnail("title", "path/to/img", "website.org"))
  expect_snapshot(thumbnail("title", "path/to/img", "website.org", caption = FALSE))
  expect_snapshot(thumbnail("title", "path/to/img", "website.org", caption = TRUE, source = "repo.org/source"))
  expect_snapshot(thumbnail("title", "path/to/img", "website.org", caption = FALSE, source = "repo.org/source"))
})

test_that("create thumbnails of 3 columns", {
  thumbs1 <- thumbnail("title", "path/to/img", "website.org")
  thumbs2 <- thumbnail("title", "path/to/img", "website.org", caption = FALSE)
  thumbs3 <- thumbnail("title", "path/to/img", "website.org", source = "repo.org/source")
  expect_snapshot(thumbnails(thumbs1))
  expect_snapshot(thumbnails(list(thumbs1, thumbs2)))
  expect_snapshot(thumbnails(list(thumbs1, thumbs2, thumbs3)))
  expect_snapshot(thumbnails(list(thumbs1, thumbs2, thumbs3, thumbs1)))
})

test_that("Specify examples in YAML", {
  yaml <- withr::local_tempfile(fileext = ".yml")
  cat2 <- function(..., file = yaml, append = TRUE) {
    cat(..., sep = "\n", file = file, append = append)
  }
  cat2(c("- title: title", "  href: website.org", "  img: path/to/img"), append = FALSE)
  cat2(c("- title: showcase TRUE", "  href: website.org", "  img: path/to/img","  showcase: TRUE"))
  cat2(c("- title: shiny TRUE", "  href: website.org", "  img: path/to/img","  shiny: TRUE"))
  cat2("\n")
  expect_snapshot(examples(yaml))
  expect_snapshot(examples(yaml, showcaseOnly = TRUE))
  expect_snapshot(examples(yaml, shinyOnly = TRUE))
})
