library(shiny)
library(shinyDND)

# Define UI for application that draws a histogram
ui <- shinyUI(
  mainPanel(
    HTML('<a href="https://github.com/ayayron/shinydnd"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://camo.githubusercontent.com/a6677b08c955af8400f44c6298f40e7d19cc5b2d/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f677261795f3664366436642e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_right_gray_6d6d6d.png"></a>'),
    h1("Drag and Drop Shiny Functions"),
    p("This is an implementation of drag and drop methods for shiny.
      Currently this can be installed with devtools:"),
    code("devtools::install_github('ayayron/shinydnd')"),
    h2("DragUI"),
    p("Draggable div elements can now be easily created in your shiny code by running:"),
    code("library(shinyDND)"), br(),
    code('dragUI("div6","bar")'),
    p("where div6 is the name of the div element and bar is the text in the element."),
    div(dragUI("div6","bar"), style="margin-left:-90%"),
    p("The elements can be styled using css (the class is currently dragelement) and setting
      the class parameter."),
    code('dragUI("div5","foo", style = "background-color:red", class = "dragelement")'), br(), br(),
    div(dragUI("div5","foo", style = "background-color:red", class = "dragelement"), style = "margin-left:-90%"),
    p("Also, the elements don't have to just be text. You can use HTML tag elements 
      (tags$) or HTML(), such as 'a' links inside the element."),
    code('dragUI("div4",tags$a("a",href = "foo"))'), br(), br(),
    div(dragUI("div4",tags$a("a",href = "foo")), style = "margin-left:-90%"),
    h2("Drop UI"),
    p("A drop area can be created for these draggable elements"),
    h2("Drop UI, vertical stacking"),
    p("If you try to drop more than one draggable element into a drop area,
      they are placed horizontally. If you want to place them vertically,
      you can add the parameters row_n = X and col_n = Y, where X and Y are 
      the number of rows and columns, respectively, that will be generated in the drop area."),
    code('dropUI("div3",row_n = 4, col_n = 3)'), br(), br(),
    dropUI("div3", row_n = 4, col_n = 3),
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
    div(dragSetUI("div1", textval = list("foo",tags$a("a",href = "bar"), "baz")), style="margin-left:-90%")
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
