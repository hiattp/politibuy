$(document).ready(function(){
  var needsFocus = "#user_password";
  
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
  $('#request-invite-button').live('click', function() {
    var email = $('#invite-email-field').val();
    var opt_in = true;
    var dataString = 'user[email]='+ email + '&user[opt_in]=' + opt_in;
    $.ajax({
      type: "POST",
      url: "/users",
      data: dataString,
      success: function(data) {
        if($(data).find("#error_explanation").length > 0){
          $('#invite-email-field').val("");
          alert("Error Message: "+ $(data).find("#error_explanation").find("li").text());
        } else {
          $("div#invitation-thank-you").show();
          $("form#request-invite-form").hide();
        }
      }
    });
    return false;
  });
  
  
});