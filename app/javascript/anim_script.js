require('jquery');

document.addEventListener('DOMContentLoaded', function() {
  $('#ask-button').click(function() {
    console.log('Button clicked'); // добавьте эту строку
    $('#ask-form').slideToggle(300);
    return false;
  });
});