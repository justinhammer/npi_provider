import jquery from 'jquery'
window.jquery = jquery
window.$ = jquery

$("#provider-search-field").keypress(function(event) {
  if (!event.charCode) return true;          
  let ch = String.fromCharCode(event.charCode);
  return (/[\d]/.test(ch));
});

$('.clickable-row').on('click', function () {
  window.location = $(this).data('href');
});