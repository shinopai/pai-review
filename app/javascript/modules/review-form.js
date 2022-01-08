$(document).on('turbolinks:load', function () {
  $('#review-form-trigger').click(function () {
    $('#review-form').toggleClass('hidden');
  })
});
