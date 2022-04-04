#' Create a paged document based on the SLU MS-Word template "allman"
#'
#' This output format is based on pagedown::jss_paged and other code in pagedown.
#' @param ...,css,template,csl,highlight,pandoc_args Arguments passed to \code{\link{pagedown::html_paged}()}.
#' @return An R Markdown output format.
#' @export
allman <- function(
  ..., css = system.file('resources', 'css',
                         c('SLU-fonts.css', 'SLU-page.css', 'SLU.css'),
                         package = 'SLUdown', mustWork = TRUE),
  template = system.file('resources', 'html', 'allman.html', package = "SLUdown", mustWork = TRUE),
  csl = pagedown:::pkg_resource('csl', 'journal-of-statistical-software.csl'),
  highlight = NULL, pandoc_args = NULL
) {
  allman_format <- pagedown::html_paged(
    ..., template = template, css = css,
    csl = csl, highlight = highlight,
    number_sections = FALSE,
    pandoc_args = c(
      pagedown:::lua_filters('jss.lua'),
      '--metadata', 'link-citations=true',
      pandoc_args
    )
  )

  opts_allman = list(
    prompt = TRUE, comment = NA, R.options = list(prompt = 'R> ', continue = 'R+ '),
    fig.align = 'center', fig.width = 4.9, fig.height = 3.675,
    class.source = 'r-chunk-code'
  )
  for (i in names(opts_allman)) {
    allman_format$knitr$opts_chunk[[i]] = opts_allman[[i]]
  }

  allman_format
}
