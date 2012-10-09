// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
    
  var processPayment = {
    setupForm : function(){
      $("form.payment-form").submit(function(){
        
        $('input[type=submit]').attr('disabled', true);
        
        // test for empty fields that are required on new pledge (require sets to true on new pledge page)
        if(requirePaymentFields){
          var alertMessage = false;
          
          if($("#new-pledge-amount").val().length == 0){
            alertMessage = "You must specify an amount.";
          }
          
          $(".req-user-info").each(function(i,el){
            if($(el).val().length == 0){
              alertMessage = "All name and address information is required."
            }
          });
          
          if(alertMessage){
            $('input[type=submit]').attr('disabled', false);
            alert(alertMessage);
            return false;
          }
        }
        
        // Do not require credit card info if credit card exists in db
        if ($(".pledge-existing-customer").length) requirePaymentFields = false;
        
        if($('#card_number').length && ($('#card_number').val().length > 0 || requirePaymentFields)){
          processPayment.processCard();
          // console.log("seeing a card number");
          return false;
        } else if($(".pledge-existing-customer").length){
          // console.log('seeing an existing customer');
          $("form.payment-form")[0].submit();
        } else {
          // console.log('not seeing existing or card number');
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
        $('.hidden-token-field').val(response.id);
        $('form.payment-form')[0].submit();
      } else {
        alert(response.error.message);
        $('input[type=submit]').attr('disabled', false);
      }
    }
  }
  if(politibuyPaymentNeeded){
    Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content')); 
    processPayment.setupForm();
  }
});