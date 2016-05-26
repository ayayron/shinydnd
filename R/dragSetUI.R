#'dragSetUI
#'
#'With draggable elements, you may not want to create one at a time, 
#'instead creating a set with a common id prefix. This simplifies the process
#'to pass a vector of elements instead of using a loop or apply function to generate
#'
#'@param id The div id of the draggable element set
#'@param text_val The vector with the name for each of the draggable elements
#'@return Returns the set of dragable div elements. Currently they all have the same name.
dragSetUI = function(id,textval=c("")) {
  ns <- NS(id)
  divlist = lapply(textval,dragUI,id=id)
  dragSetUI = tags$div(divlist)
  htmltools::attachDependencies(dragSetUI, shinyDNDDep)
}
