% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/templates.R
\name{setup-helpers}
\alias{setup-helpers}
\alias{use_coc}
\alias{use_contributing}
\alias{use_github_action_quillt_pkgdown}
\alias{use_github_action_lock_thread}
\alias{use_quillt_pkgdown}
\alias{use_quillt_issue_template}
\title{Helpers for project setup with quillt}
\usage{
use_coc()

use_contributing()

use_github_action_quillt_pkgdown()

use_github_action_lock_thread()

use_quillt_pkgdown(config_file = "_pkgdown.yml", destdir = "reference")

use_quillt_issue_template(
  issue_guide = TRUE,
  community = TRUE,
  so = TRUE,
  blank_issue = FALSE
)
}
\arguments{
\item{config_file}{Path to the pkgdown yaml config file - could be set to be
\verb{pkgdown/} subfolder.}

\item{destdir}{Target directory for pkgdown docs. By default, it will be in
\code{reference} sub directory for R Markdown related package using \strong{quillt}.}

\item{issue_guide}{default \code{TRUE} will add a link to
\verb{https://yihui.org/issue/}. You can pass a custom link as character vector.
Set to \code{FALSE} to not include this option in the issue chooser.}

\item{community}{default \code{TRUE} will add a link to
\verb{https://community.rstudio.com/}. You can pass a custom link as character
vector. Set to \code{FALSE} to not include this option in the issue chooser.}

\item{so}{default \code{TRUE} will add a link to
\verb{https://stackoverflow.com/questions/tagged/r}. You can pass a custom link
as character vector. Set to \code{FALSE} to not include this option in the issue
chooser.}

\item{blank_issue}{\code{FALSE} by default. Sets to \code{TRUE} to allow blank issue with no template.}
}
\description{
These helper are mostly inspired by the one in \strong{usethis} from the tidyverse
team and are useful to setup a new pkgdown project with \strong{quillt}
}
\details{
\itemize{
\item \code{use_coc()}: use \code{usethis::use_tidy_coc()} and put _CODE\_OF\\emph{CONDUCT.md} in
\verb{.github/} directory setting the contact email to Rstudio one.
\item \code{use_contributing()}: Add a \emph{CONTRIBUTING.md} file in \verb{.github/} following a
template in \strong{quillt}. Inspired by \code{usethis::use_tidy_contributing()}.
\item \code{use_quillt_pkgdown()}: Create all the necessary files and configuration to
configure a pkgdown website to use theming and organization for the R
Markdown ecosystem. It adds pkgdown configuration, dependencies in
DESCRIPTION, template for vignettes (including the Example gallery one) and other common assets.
\item \code{use_github_action_quillt_pkgdown()}: Set a Github Action workflow to build a
pkgdown website and deploy to Netlify. The deployment action use allow a main
deploy branch and PR previews. This action will be triggered on PR only for
branch targetting master and with a name starting with \verb{pkgdown/}
\item \code{use_quillt_issue_template()}: Add default issue templates for Github
issues. See \href{https://docs.github.com/en/github/building-a-strong-community/configuring-issue-templates-for-your-repository#configuring-the-template-chooser}{Github Docs}
}
}
