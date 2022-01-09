$(document).on('turbolinks:load', function () {
  let $score;
  let $reviewArea = $('#review-area');
  for (let i = 0; i < $reviewArea.data('score'); i++) {
    $score += '<i class="fas fa-star text-yellow-300"></i>';
  }

  $reviewArea.append($score + '(' + $reviewArea.data('score') + ')');
});
