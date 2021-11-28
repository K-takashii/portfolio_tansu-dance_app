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
    console.log($(nextLink).length);
    if ( $(nextLink).length == 0 ){
      return;
    }
    console.log(parseInt($('span.current').html()));
    var nextPage =  parseInt($('span.current').html())+1;
    $.ajax({
      type: 'GET',
      url: '/categories/more?page=' + nextPage,
      dataType: 'script'
    }).done(function (res) {
      //console.log(res)
    }).always(function () {
      progress = false
    })
    // console.log($('.jscroll').find('span.next a'));
    // $('.jscroll').jscroll({
    //   contentSelector: '.jscroll',
    //   nextSelector: 'span.next:last a'
    // });
  }
});

// $(document).ready(function () {
//   $('.jscroll').find('span.next').find('a').on('click', function (e) {
//     // location.href = e.target.href
//   });
// });

/*
$(window).on('scroll', function() {
  scrollHeight = $(document).height();
  scrollPosition = $(window).height() + $(window).scrollTop();
  if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.05) {
    $('.jscroll').jscroll({
      autoTrigger: true,
      debug: true,
      contentSelector: '.scroll-list',
      nextSelector: 'span.next:last a'
    });
  }
});
*/


/*
$(document).ready(function(){
  $('.jscroll').jscroll({
    autoTrigger: true,
      contentSelector: '.scroll-list',
      nextSelector: 'span.next a'
    });
})
*/