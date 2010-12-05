$(document).ready(function(){
    $(".fields a").click(function(){
        $(this).prev("input[type=hidden]").val("1");
        $(this).closest(".fields").fadeOut("slow");
    });
});


//css("border","3px solid red");