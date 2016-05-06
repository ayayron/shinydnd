library(shiny)


dragSetUI = function(id,textval=c("")) {
  ns <- NS(id)
  divlist = lapply(textval,dragUI,id=id)
  tags$div(divlist)
}

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

dragUI = function(id,...,style=NULL,class="dragelement"){
  ns <- NS(id)
  return(tags$div(id=id,class=class, draggable=TRUE,
           style=style,list(...)))
}

registerInputHandler("dragdropshiny.dropper", function(data,...) {
  if (is.null(data) | data == "")
    NULL
  else
    data
}, force = TRUE)

# Define UI for application that draws a histogram
ui <- shinyUI(
  
  mainPanel(
    tagList(
    tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "dragndrop.css"),
              tags$script(src = "dragndrop.js")#,
              # tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap-tour-standalone.min.css"),
              # tags$script(src = "bootstrap-tour-standalone.min.js"),
              # tags$script(src = "shiny-tour.js")
    )),
    h1("Drag and Drop Shiny Functions"),
    p("This is an implementation of drag and drop methods for shiny."),
    h2("DragSetUI"),
    dragSetUI("div1",textval=c("foo","bar","kai")),
    h2("Single DragUI"),
    dragUI("div5","foo"),
    dragUI("div4","bar"),
    dragUI("div6","bar"),
    h2("Drop UI, vertical stacking"),
    dropUI("div3",vertical=TRUE),
    h2("Drop UI, Reactive"),
    dropUI("div2"),
    verbatimTextOutput("foo") 
  )
)


# Define server logic required to draw a histogram
server = shinyServer(function(input, output,session) {
  observeEvent(input$div2,{
    output$foo = renderText(input$div2)
    
  })
})

# Run the application 
shinyApp(ui = ui, server = server)

