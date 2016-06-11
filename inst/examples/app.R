library(shiny)
# library(devtools)
# devtools::install_bitbucket("ahoffer/shinydnd")
library(shinyDND)

# Define UI for application that draws a histogram
ui <- shinyUI(
  
  mainPanel(
    tagList(
    tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "dragndrop.css"),
              tags$script(src = "dragndrop.js")
    )),
    h1("Drag and Drop Shiny Functions"),
    p("This is an implementation of drag and drop methods for shiny."),
    h2("DragSetUI"),
    dragSetUI("div1", textval = c("foo","bar","kai")),
    h2("Single DragUI"),
    dragUI("div5","foo"),
    dragUI("div4","bar"),
    dragUI("div6","bar"),
    h2("Drop UI, vertical stacking"),
    dropUI("div3",vertical = TRUE),
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

