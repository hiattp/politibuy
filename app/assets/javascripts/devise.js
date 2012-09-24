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
});