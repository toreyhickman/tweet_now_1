$(document).ready(function() {

  $('.container form#tweeter').on('submit', function(event) {

    event.preventDefault();

    message_to_tweet = $('.container form textarea').val();
    params = { tweet_text: message_to_tweet };

    $('.container form#tweeter').fadeOut(500);
    $('.container form textarea').val("");

    $('#message_to_user').text("Sending your tweet ...");

    $.post('/', params, function(data) {

      $('#message_to_user').text(data);
      $('.container form#tweeter').fadeIn(500);

    });
  });
});
