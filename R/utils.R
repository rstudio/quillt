check_installed <- function(pkgs) {
    inst <- vapply(pkgs, requireNamespace, quietly = TRUE, FUN.VALUE = logical(1))
    if (all(inst)) {
      return()
    }
    stop("Must install the following packages to use this function:\n",
         paste0("* ", pkgs[!inst], "\n"), call. = FALSE)
}
