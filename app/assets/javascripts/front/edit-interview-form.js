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

$(function(){
  $("#edit-financial-info-btn").click(function(){
    $("#edit-financial-info").removeClass("hidden");
    $("#financial_info").addClass("hidden");
  })
});
