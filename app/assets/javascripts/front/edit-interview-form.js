$(function(){
  $("#flat-found-btn").click(function(){
    $("#add-flat-form").removeClass("hidden");
    $(this).addClass("hidden");
  })
});


$(function(){
  $("#edit-personal-info-btn").click(function(){
    $("#edit-personal-info").removeClass("hidden");
    $("#personal_info").addClass("hidden");
  })
});
