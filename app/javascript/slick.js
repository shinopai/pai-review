$(document).on('turbolinks:load', function () {
  $('.slider').slick({
    prevArrow: '<i class="fas fa-arrow-alt-circle-left"></i>',
    nextArrow: '<i class="fas fa-arrow-alt-circle-right"></i>',
    autoplay: true,
    autoplaySpeed: 5000
  });
});
