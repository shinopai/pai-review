$(document).on('turbolinks:load', function () {
  $('#search-form-trigger').click(function () {
    $('#search-form').toggleClass('hidden');
  })
});
