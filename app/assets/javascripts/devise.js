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
  
  // Save current value of zipcode
  $("input#user_zip_code").data('oldVal', $(this).val());

  // Look for changes in the zipcode value
  $("input#user_zip_code").bind("propertychange keyup input paste", function(event){
    // If value has changed...
    if ($(this).data('oldVal') != $(this).val()) {
      // Updated stored value
      $(this).data('oldVal', $(this).val());

       // Do action
      if($(this).val().length == 5){
        getCityAndStateFromZip($(this).val());
      }
    }
  });
  
});

function getCityAndStateFromZip(zip){
  $("img.account-page-loader").show();
  $("span.account-zip-city-state").hide();
  $.ajax('/users/unzip?zip='+zip, {
    dataType: 'JSON',
    type: 'GET',
    success: function(result){
      $("img.account-page-loader").hide();
      $("span.account-zip-city-state").text(ucFirstAllWords(result.city.toLowerCase())+", "+result.state).show();
    },
    error: function(result){
      // should probably add something else here to help user in this case
      $("span.account-zip-city-state").hide();
      $("img.account-page-loader").hide();
    }
  });
}

function ucFirstAllWords( str ) {
  var pieces = str.split(" ");
  for ( var i = 0; i < pieces.length; i++ ) {
      var j = pieces[i].charAt(0).toUpperCase();
      pieces[i] = j + pieces[i].substr(1);
  }
  return pieces.join(" ");
}