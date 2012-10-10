$(document).ready(function(){
  var needsFocus = "#user_password";
  loadSocial();
  
  $("#user_email").focus(function(){
    needsFocus = "#user_password";
  });
  
  $("#user_password").focus(function(){
    needsFocus = "#user_email";
  });
  
  $("#forgot-password-link").focus(function(){
    $(needsFocus).focus();
  });
  
  // use AJAX to submit the "request invitation" form
  $('form#request-invite-form').submit(function() {
    $('input[type=submit]').attr('disabled', true);
    var email = $('#invite-email-field').val();
    var dataString = 'user[email]='+ email;
    $.ajax({
      type: "POST",
      url: "/users",
      data: dataString,
      success: function(data) {
        if($(data).find("#error_explanation").length > 0){
          $('#invite-email-field').val("");
          alert("Error Message: "+ $(data).find("#error_explanation").find("li").text());
          $('input[type=submit]').attr('disabled', false);
          return false;
        } else {
          $("div#invitation-form-wrapper").hide();
          $("div#invitation-thank-you").show();
          return false;
        }
      },
      error: function(data){
        alert("Sorry, an error has prevented us from saving your email. Please refresh the page and try again.");
      }
    });
    return false;
  });
  
  $("a.edit-card-info").click(function(e){
    e.preventDefault();
    $(".pledge-existing-customer").toggle();
    $(".account-edit-card-entry").toggle();
  });
  
});