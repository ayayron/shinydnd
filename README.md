# shinyDND[![Build Status](https://travis-ci.org/ayayron/shinydnd.svg?branch=master)](https://travis-ci.org/ayayron/shinydnd)
__shinyDND__ is an R package to create Shiny drag and drop elements in R.

See the example at: [https://ayayron.shinyapps.io/dragndrop/](https://ayayron.shinyapps.io/dragndrop/).
That example shown below is also available in the package __/examples/app.R__. (It will be added to shinyapps.io once the package is accepted in CRAN.)

The package can be installed and loaded with:
```r
devtools::install_github('ayayron/shinydnd')
library(shinyDND)
```

## Functions

* _dragUI_: Draggable div element.
* _dragSetUI_: Set of draggable div elements.
* _dropUI_: Droppable div element.

###dragUI
Draggable div elements can now be easily created in your shiny code by running:
```r 
dragUI("div6", "bar")
```
where __div6__ is the name of the div element and __bar__ is the text in the element. The elements can be styled using css (the class is currently ```dragelement```) and setting the class parameter.
```r
dragUI("div5", "foo", style = "background-color:red", class = "dragelement")
```
Also, the elements don't have to just be text. You can use HTML tag elements 
(e.g. `tags$a("mylink", href="#mylink")`) or `HTML()` inside the element.

```r 
dragUI("div4",tags$a("a",href = "foo"))
```

###dropUI
A drop area can be created for these draggable elements with the function:
```r
dropUI("div3")
```
If you try to drop more than one draggable element into a drop area,
they are placed horizontally. If you want to place them vertically,
you can add the parameters `vertical = TRUE` and `nrow = X`, where __X__ is 
the number of rows that will be generated in the drop area.
```r
dropUI("div3", vertical = TRUE, nrow = 4)
```
The drop area can be made reactive, such that when something is dragged
into it a reactive function will run. Using the observeEvent function
where the event is the input name of the dropUI div, can trigger a server action. 
Here, if you drag each element into the dropUI it will print the name of the element.
```r
observeEvent(input$div2, {
    output$foo = renderText(paste("The dropUI element currently contains:", input$div2))
})
```
Similar to the dragUI elements, the element can be styled using the style parameter or
the class parameter (the class is currently ```dropelement```) in css.

###dragSetUI
To make it easier to create multiple draggable elements there is a secoond function
called DragSetUI. Here you can specify each of the elements in a list and it will create
multiple elements with the div name prefix you feed it.
```r
dragSetUI("div1", textval = list("foo", tags$a("a", href = "bar"), "baz"))
```


## Example
After installing the package you can run this example app: ```runApp(system.file('examples', package='shinyDND'))```. For readability, this code below excludes the explanations above.
```r
library(shiny)
library(shinyDND)

# Define UI for application that draws a histogram
ui <- shinyUI(
  mainPanel(
    h2("DragUI"),
    dragUI("div6","bar"),
    dragUI("div5","foo", style = "background-color:red", class = "dragelement"),
    dragUI("div4",tags$a("a",href = "foo")),
    h2("Drop UI"),
    dropUI("div3",vertical = TRUE, nrow = 4),
    dropUI("div2"),
    h2("DragSetUI"),
    dragSetUI("div1", textval = list("foo",tags$a("a",href = "bar"),"baz"))
  )
)

# server with reactive for observing reactive drop event
server = shinyServer(function(input, output,session) {
  observeEvent(input$div2,{
    output$foo = renderText(
      paste("The dropUI element currently contains:", input$div2))
  })
})

# Run the application 
shinyApp(ui = ui, server = server)
```