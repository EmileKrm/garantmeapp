$(function(){
  $("#flat-found-btn").click(function(){
    $("#add-flat-form").removeClass("hidden");
    $(this).addClass("hidden");
  })
});

// Personal info edit
$(function(){
  $("#edit-personal-info-btn").click(function(){
    $("#edit-personal-info").removeClass("hidden");
    $("#personal_info").addClass("hidden");
  })
});


// Financial info edit
$(function(){
  $("#edit-financial-info-btn").click(function(){
    $("#edit-financial-info").removeClass("hidden");
    $("#financial_info").addClass("hidden");
  })
});

$(function(){
  $("#save-financial-btn").click(function(){
    $("#edit-financial-info").addClass("hidden");
    $("#financial_info").removeClass("hidden");
  })
});
