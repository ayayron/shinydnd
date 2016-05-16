dropUI = function(id,style=NULL,class="dropelement",vertical=FALSE) {
  ns = NS(id)
  if(vertical == TRUE) {
    divlist = list(tags$div(style="height:20px"),
                   tags$div(style="height:20px"),
                   tags$div(style="height:20px")
                   )
    tags$div(id=id,class=class,style=style,divlist)
  } else {
    tags$div(id=id,class=class,style=style)
  }
    
}