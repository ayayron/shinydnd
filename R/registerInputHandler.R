registerInputHandler("dragdropshiny.dropper", function(data,...) {
  if (is.null(data) | data == "")
    NULL
  else
    data
}, force = TRUE)