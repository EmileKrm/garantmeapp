$(document).ready(function(){
  $('.datepicker').datepicker({
    format: 'dd/mm/yyyy',
    startDate: new Date()
  });
  $('.datepicker').datepicker().on('changeDate',function(e) {
   $('.datepicker').datepicker('hide');
  });
})
