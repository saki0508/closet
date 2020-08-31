
$(document).on('turbolinks:load', function() {
  $('.fade-in-btn').hover(function() {
    $('.fade-in').fadeIn(1500);
  });
});