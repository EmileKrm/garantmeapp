$('document').ready(function() {
  $('#show-chat').click(function(event){
    event.preventDefault();
    $('#chat').toggleClass('hidden');
  });
});
