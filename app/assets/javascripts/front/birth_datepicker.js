$(document).ready(function(){
  $('.birth_datepicker').datepicker({
    format: 'dd/mm/yyyy',
  });
  $('.birth_datepicker').datepicker().on('changeDate',function(e) {
    $('.birth_datepicker').datepicker('hide');
  });
})
