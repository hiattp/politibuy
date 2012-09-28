// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
  
  var processPayment = {
    setupForm : function(){
      $("form#new-pledge-form").submit(function(){
        $('input[type=submit]').attr('disabled', true);
        if($('#card_number').length){
          processPayment.processCard();
          return false;
        } else {
          return true;
        }
      });
    },
    processCard : function(){
      var card = {
        number: $('#card_number').val(),
        cvc: $('#card_code').val(),
        expMonth: $('#card_month').val(),
        expYear: $('#card_year').val()
      }
      Stripe.createToken(card, processPayment.handleStripeResponse)
    },
    handleStripeResponse : function(status, response){
      if(status == 200){
        $('#pledge_stripe_card_token').val(response.id);
        $('form#new-pledge-form')[0].submit();
      } else {
        // $('#stripe_error').text(response.error.message);
        $('input[type=submit]').attr('disabled', false);
      }
    }
  }
  
  processPayment.setupForm();
});