/**
 * 
 */
$("header").mouseover(function() {
  $(this).addClass("header-background");
  // $(".hidden-menu").css("position", "relative")
  $(".hidden-menu").slideDown();
})

$("header").mouseleave(function() {
  setTimeout(function() {
    $("header").removeClass('header-background');
  }, 400);
  $(".hidden-menu").stop().slideUp();
})

$(".loupe").on('click', function() {
  $("body").css("overflow", "hidden");
  $("header").css("z-index", -1);
  $(".search-modal").addClass("see-modal");
})

$(".close").on('click', function() {
  $("body").css("overflow", "");
  $("header").css("z-index", 1000);
  $(".search-modal").removeClass("see-modal");
})
