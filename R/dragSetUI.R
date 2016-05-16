#'dragSetUI

dragSetUI = function(id,textval=c("")) {
  ns <- NS(id)
  divlist = lapply(textval,dragUI,id=id)
  tags$div(divlist)
}