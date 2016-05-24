#' foo: A package for computating the notorious bar statistic.
#'
#' The foo package provides three categories of important functions:
#' foo, bar and baz.
#' 
#' @section Foo functions:
#' The foo functions ...
#'
#' @docType package
#' @name shinyDND
.onAttach <- function(...) {
	library(shiny)
	registerInputHandler("dragdropshiny.dropper", function(data,...) {
		if (is.null(data) | data == "")
	  	return(NULL)
		else
	  	return(data)
	}, force = TRUE)

  # Create link to javascript and css files for package
  shiny::addResourcePath("shinydnd", system.file("www", package="shinyDND"))
}

shinyDNDDep = htmltools::htmlDependency("shinyDND", packageVersion("shinyDND"), 
	src = c("href" = "shinydnd"), script = "dragndrop.js", stylesheet = "dragndrop.css")
