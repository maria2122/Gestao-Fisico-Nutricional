$('.sub-menu a').click(function(){
  $(this).parent("li").children("ul").slideToggle('active');
});