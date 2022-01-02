$(window).scroll(function () {
  let scroll = $(this).scrollTop();

  if (scroll > 100) {
    $('.header-nav').removeClass('hidden').addClass('block');
  } else {
    $('.header-nav').removeClass('block').addClass('hidden');
  }

  $('.auth-menu-trigger').on('click', function () {
    $('.auth-menu').toggleClass('hidden');
  })
})
