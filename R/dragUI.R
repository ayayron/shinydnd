dragUI = function(id,...,style=NULL,class="dragelement"){
  ns <- NS(id)
  return(tags$div(id=id,class=class, draggable=TRUE,
           style=style,list(...)))
}