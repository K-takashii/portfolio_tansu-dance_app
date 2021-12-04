// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require_tree .

// $(document).ready(function(){
//   $('.your-class').slick({
//     slidesToShow: 4,
//     slidesToScroll: 4,
//     dots: true,
//     draggable: false
//   });
// });

var progress = false;
$(window).on('scroll', function() {
  if (progress) return;
  var scrollHeight = $(document).height();
  var scrollPosition = $(window).height() + $(window).scrollTop();
  if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.05) {
    progress = true
    var nextLink = $('span.next > a')[0]
    if ( $(nextLink).length == 0 ){
      return;
    }
    var nextPage =  parseInt($('span.current').html())+1;
    $.ajax({
      type: 'GET',
      url: '/categories/more?page=' + nextPage,
      dataType: 'script'
    }).done(function (res) {
    }).always(function () {
      progress = false
    })
  }
});
