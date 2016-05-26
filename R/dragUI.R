#'dragUI
#'
#'Create a draggable UI element.
#'
#'@param id The div id of the element
#'@param style Add a string with additional css styling not defined by id or class
#'@param class The css class style, uses the standard "dragelement" class that it comes with
#'@return dragable div element
#'export
dragUI = function(id,...,style=NULL,class="dragelement"){
  ns <- NS(id)

  dragUI = tags$div(id=id,class=class,draggable=TRUE,
           style=style,list(...))
  htmltools::attachDependencies(dragUI, shinyDNDDep)
}
