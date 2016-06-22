$(document).ready(function(){
  $(".dropelement").on("dragover",function(e){
    e.preventDefault();
  });
  $(".dragelement").on("dragstart",function(e){
    e.originalEvent.dataTransfer.setData("Text",e.target.id);
  });
  $(".dropelement").on("drop",function(e){
    e.preventDefault();
    var data=e.originalEvent.dataTransfer.getData("Text");
    e.target.appendChild(document.getElementById(data));
    var el = $(e.target);
    el.trigger("change");
  });
});

var dragDropBinding = new Shiny.InputBinding();
$.extend(dragDropBinding, {
  find: function(scope) {
    return $(scope).find(".dropelement");
  },
  getValue: function(el) {
    return $(el).text();
  },
  setValue: function(el) {
    $(el).text();
  },
  subscribe: function(el, callback) {
    $(el).on("change", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".dragDropBinding");
  },
  getType: function() {
  	return "dragdropshiny.dropper";
}

});

Shiny.inputBindings.register(dragDropBinding);
