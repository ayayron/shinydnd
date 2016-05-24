#'dragUI
#'
#'@param id The div id of the element
#'@param style The css styling
#'@param class The css class style
#'@return dragable div element
#'export
dragUI = function(id,...,style=NULL,class="dragelement"){
  ns <- NS(id)

  dragUI = tags$div(id=id,class=class, draggable=TRUE,
           style=style,list(...))
  htmltools::attachDependencies(dragUI, shinyDNDDep)
}