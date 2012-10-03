// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function(){
  if($("#flash-wrapper-outer").length > 0){
    setTimeout(function(){
      removeFlashes();
    }, 5000);
  }
});

function removeFlashes(){
  $("#flash-wrapper-outer").fadeOut();
}