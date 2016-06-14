#'dragSetUI
#'
#'With draggable elements, you may not want to create one at a time, 
#'instead creating a set with a common id prefix. This simplifies the process
#'to pass a vector of elements instead of using a loop or apply function to generate
#'
#'@param id The div id of the draggable element set
#'@param textval The list with the name for each of the draggable elements
#'@return Returns the set of dragable div elements.
#'@examples dragSetUI("dragset", list("foo", "bar", "baz"))
#'@import htmltools
#'@export

dragSetUI = function(id, textval=list("")) {
  divlist = lapply(textval, 
                   function(x, div_id = id) { dragUI(paste0(div_id,x), x) })
  dragSetUI = htmltools::tags$div(divlist)
  htmltools::attachDependencies(dragSetUI, shinyDNDDep)
}
