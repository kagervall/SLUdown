% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/output.R
\name{allman}
\alias{allman}
\title{Create a paged document based on the SLU MS-Word template "allman"}
\usage{
allman(
  ...,
  css = system.file("resources", "css", c("SLU-fonts.css", "SLU-page.css", "SLU.css"),
    package = "SLUdown", mustWork = TRUE),
  template = system.file("resources", "html", "allman.html", package = "SLUdown",
    mustWork = TRUE),
  csl = pagedown:::pkg_resource("csl", "journal-of-statistical-software.csl"),
  highlight = NULL,
  pandoc_args = NULL
)
}
\arguments{
\item{..., css, template, csl, highlight, pandoc_args}{Arguments passed to \code{\link{pagedown::html_paged}()}.}
}
\value{
An R Markdown output format.
}
\description{
This output format is based on pagedown::jss_paged and other code in pagedown.
}
