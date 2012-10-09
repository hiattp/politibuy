// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  $("li.participant-wrapper").hover(
    function(e){
      $(".participant-amount-wrapper", this).show();
      $("h4.participant-amount", this).show();
    },
    function(e){
      $(".participant-amount-wrapper", this).hide();
      $("h4.participant-amount", this).hide();      
    }
  );
  
  $("#policy-maker-form-show").click(function(e){
    e.preventDefault();
    $(".policy-maker-form-wrapper").toggle();
  });
  
  $("#vehicle-form-show").click(function(e){
    e.preventDefault();
    $(".vehicle-form-wrapper").toggle();
  });
  
  
});