// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from 'bootstrap'
import "./src/jquery"

$("#provider-search-field").keypress(function(event) {
  if (!event.charCode) return true;          
  let ch = String.fromCharCode(event.charCode);
  return (/[\d]/.test(ch));
});

$('.clickable-row').on('click', function () {
  window.location = $(this).data('href');
});
