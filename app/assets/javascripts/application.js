// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('page:change', function(){
  startTablesorter();
})

// $(document).on('page:load', function() {
//   startTablesorter();
// });

var startTablesorter = function(){
  // call the tablesorter plugin
  $(".all-table").tablesorter({
    sortList: [[4,0]]
  }).tablesorterPager({
    container: $('#all-pager'),
    size: 20,
    output: '{page}/{totalPages} Pages'
  });

  $(".pending-table").tablesorter({
    sortList: [[4,0]]
  }).tablesorterPager({
    container: $('#pending-pager'),
    size: 20,
    output: '{page}/{totalPages} Pages'
  });
}


