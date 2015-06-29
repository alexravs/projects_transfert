$(function(){
  $(".which-login-form").on("click", "li", function() {
    $(this).parent().children("li").removeClass("active");
    $(this).toggleClass("active");
    $(".sign-up-box-ceo, .sign-up-box-employee").toggleClass("hide")
   
  })
  
  $(".priority_task").on("hover", "li.hover", function() {
    $(this).toggleClass("put_task_before_others effect-shadow");
    //$(this).parent().toggleClass("effect-shadow");
   
  })
  $('body').popover({ selector: '[data-popover]', trigger: 'click hover', placement: 'auto', delay: {show: 50, hide: 50}});
})

