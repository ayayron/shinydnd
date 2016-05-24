#'dragSetUI
#'
#'@param id The div id of the draggable element set
#'@return dragable div element
dragSetUI = function(id,textval=c("")) {
  ns <- NS(id)
  divlist = lapply(textval,dragUI,id=id)
  dragSetUI = tags$div(divlist)
  htmltools::attachDependencies(dragSetUI, shinyDNDDep)
}
