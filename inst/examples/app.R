library(shiny)
library(shinyDND)

# Define UI for application that draws a histogram
ui <- shinyUI(
  mainPanel(
    h1("Drag and Drop Shiny Functions"),
    p("This is an implementation of drag and drop methods for shiny."),
    h2("DragUI"),
    p("Draggable div elements can now be easily created in your shiny code by running:"),
    code('dragUI("div6","bar")'),
    p("where div6 is the name of the div element and bar is the text in the element."),
    dragUI("div6","bar"),
    p("The elements can be styled using css (the class is currently dragelement) and setting
      the class parameter."),
    code('dragUI("div5","foo", style = "background-color:red", class = "dragelement")'), br(), br(),
    dragUI("div5","foo", style = "background-color:red", class = "dragelement"),
    p("Also, the elements don't have to just be text. You can use HTML tag elements 
      (tags$) or HTML(), such as 'a' links inside the element."),
    code('dragUI("div4",tags$a("a",href = "foo"))'), br(), br(),
    dragUI("div4",tags$a("a",href = "foo")),
    h2("Drop UI"),
    p("A drop area can be created for these draggable elements"),
    h2("Drop UI, vertical stacking"),
    p("If you try to drop more than one draggable element into a drop area,
      they are placed horizontally. If you want to place them vertically,
      you can add the parameters vertical = TRUE and nrow = X, where X is 
      the number of rows that will be generated in the drop area."),
    code('dropUI("div3",vertical = TRUE, nrow = 4)'), br(), br(),
    dropUI("div3",vertical = TRUE, nrow = 4),
    h2("Drop UI, Reactive"),
    p("The drop area can be made reactive, such that when something is dragged
      into it a reactive function will run. Using the observeEvent function
      where the event is the input name of the dropUI div, can trigger a server action. 
      Here, if you drag each element into the dropUI it will print the name of the element.
      Similar to the dragUI elements, the element can be styled using the style parameter or
      the class parameter (the class is currently dropelement) in css."),
    code('observeEvent(input$div2,{'), br(),
    code('output$foo = renderText(paste("The dropUI element currently contains:",input$div2))'),
    br(),
    code('})'), br(), br(),
    dropUI("div2"),
    verbatimTextOutput("foo"),
    h2("DragSetUI"),
    p("To make it easier to create multiple draggable elements there is a secoond function
      called DragSetUI. Here you can specify each of the elements in a list and it will create
      multiple elements with the div name prefix you feed it."),
    code('dragSetUI("div1", textval = list("foo",tags$a("a",href = "bar"),"baz"))'), br(), br(),
    dragSetUI("div1", textval = list("foo",tags$a("a",href = "bar"),"baz"))
  )
)

server = shinyServer(function(input, output,session) {
  observeEvent(input$div2,{
    output$foo = renderText(
      paste("The dropUI element currently contains:", input$div2))
  })
})

# Run the application 
shinyApp(ui = ui, server = server)
