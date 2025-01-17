#' Lintr functions
#'
#' Run lintr on a vector of files. If \code{fnames} is \code{NULL}
#' then use the regular expression \code{^c.*Rmd$}. If
#' \code{config::get("lintr")} is \code{FALSE}, no lint used.
#' @param fnames An optional vector of filenames
#' @importFrom lintr lint
#' @export
lint_slides = function(fnames = NULL) {
  if (file.exists("config.yml") && isFALSE(config::get("lintr"))) {
    return(invisible(NULL))
  }
  if (is.null(fnames)) {
    fnames = list.files(pattern = "^c.*Rmd$")
  }
  sapply(fnames, lintr::lint)
}
