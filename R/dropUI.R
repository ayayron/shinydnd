#'dropUI
#'
#'@param id The div id of the element
#'@param style The css styling
#'@param class The css class style
#'@param row_n set the number of rows to be used in the vertical selection. Height is proportional to the number of rows.
#'@param col_n set the number of columns to be used in the vertical selection. Width is proportional to the number of columns.
#'@return div element with nested elements if vertical is true
#'@import htmltools
#'@export

dropUI = function(id, style = NULL, class = "dropelement", row_n = 1, col_n = 1) {
  if (row_n > 1 | col_n > 1) {
    row_pct = 100.0/row_n
    col_pct = 100.0/col_n
    div_element = htmltools::tags$div(style = paste0("height:", row_pct, "%;",
                                                     "width:", col_pct, "%;",
                                                     "display:table-cell;"))
    div_row = list(htmltools::tags$div(rep(list(div_element), col_n),
                                       style = paste0("height:", row_pct, "%;",
                                                      "width:", col_pct, "%;",
                                                      "display:table-row;")))
    divlist = rep(div_row, row_n)
    if (is.null(style)) {
      style = "display:table;"
    }

    dropUI = htmltools::tags$div(id = id, class = class, style = style, divlist)
    htmltools::attachDependencies(dropUI, shinyDNDDep)
  } else {
    dropUI = htmltools::tags$div(id = id, class = class, style = style)
    htmltools::attachDependencies(dropUI, shinyDNDDep)
  }
}
