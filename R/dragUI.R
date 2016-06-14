#'dragUI
#'
#'Create a draggable UI element.
#'
#'@param id The div id of the element
#'@param ... Any list of elements can be passed inside the div element itself to create more complex draggable elements, not just text
#'@param style Add a string with additional css styling not defined by id or class
#'@param class The css class style, uses the standard "dragelement" class that it comes with
#'@return dragable div element
#'@import htmltools
#'@export

dragUI = function(id,..., style = NULL, class = "dragelement") {
  dragUI = htmltools::tags$div(id = id, class = class, draggable = TRUE,
           style = style, list(...))
  htmltools::attachDependencies(dragUI, shinyDNDDep)
}
