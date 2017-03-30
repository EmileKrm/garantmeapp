$(document).ready(function(){
  $('.datepicker').datepicker({
    format: 'dd/mm/yyyy',
    startDate: new Date(),
    autoclose: true
  });

  if(date < startDate ){
    return [false, 'special']
  }
});
