$(document).ready(function() {
  $('.stepper').find('.save-step').on('click', function(){
    console.log("test");
    $('.stepper').find('.active .next-step').click();
  });
});
