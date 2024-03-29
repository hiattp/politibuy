// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  
  if($(".twitter-feed").length > 0){
    jQuery(function($){
      $(".twitter-feed").tweet({
          username: "politibuy",
          join_text: "auto",
          avatar_size: 32,
          count: 2,
          auto_join_text_default: ":", 
          auto_join_text_ed: ":",
          auto_join_text_ing: ":",
          auto_join_text_reply: ":",
          auto_join_text_url: ":",
          loading_text: "loading tweets..."
      });
    });
  }
  
  $("#landing-signup-button").click(function(e){
    e.preventDefault();
    $("#landing-call-buttons-wrapper-outer").animate({left:-800},"slow");
    $("form#request-invite-form").animate({left:0},"slow", function(){
      $("img#landing-back-arrow").fadeIn();
    });
  });
  
  $("img#landing-back-arrow").click(function(){
    $("img#landing-back-arrow").fadeOut();
    $("#landing-call-buttons-wrapper-outer").animate({left:0},"slow");
    $("form#request-invite-form").animate({left:800},"slow");
  });
  
});



function loadSocial() {
    
    //Twitter
    if (typeof (twttr) != 'undefined') {
      twttr.widgets.load();
    } else {
      $.getScript('https://platform.twitter.com/widgets.js');
    }

    //Facebook
    if (typeof (FB) != 'undefined') {
      FB.init({ status: true, cookie: true, xfbml: true });
    } else {
      $.getScript("https://connect.facebook.net/en_US/all.js#xfbml=1", function () {
        FB.init({ status: true, cookie: true, xfbml: true });
      });
    }

    //Google+
    if (typeof (gapi) != 'undefined') {
      $(".g-plusone").each(function () {
        gapi.plusone.render($(this).get(0));
      });
    } else {
      $.getScript('https://apis.google.com/js/plusone.js');
    }
    
}