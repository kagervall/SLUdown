#' Create a paged document based on the SLU MS-Word template "allman"
#'
#' This output format is based on pagedown::jss_paged and other code in pagedown.
#' @param ...,css,template,csl,highlight,pandoc_args Arguments passed to \code{\link{pagedown::html_paged}()}.
#' @return An R Markdown output format.
#' @export
allman = function(
  ..., css = c('jss-fonts', 'jss-page', 'jss'),
  template = pagedown::pkg_resource('html', 'allman.html'),
  csl = pagedown::pkg_resource('csl', 'journal-of-statistical-software.csl'),
  highlight = NULL, pandoc_args = NULL
) {
  jss_format = pagedown::html_paged(
    ..., template = template, css = css,
    csl = csl, highlight = highlight,
    number_sections = FALSE,
    pandoc_args = c(
      lua_filters('jss.lua'),
      '--metadata', 'link-citations=true',
      pandoc_args
    )
  )

  opts_jss = list(
    prompt = TRUE, comment = NA, R.options = list(prompt = 'R> ', continue = 'R+ '),
    fig.align = 'center', fig.width = 4.9, fig.height = 3.675,
    class.source = 'r-chunk-code'
  )
  for (i in names(opts_jss)) {
    jss_format$knitr$opts_chunk[[i]] = opts_jss[[i]]
  }

  jss_format
}
