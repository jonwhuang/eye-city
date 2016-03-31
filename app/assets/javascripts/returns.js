$(document).ready(function(){

  $('.m-filter').on('change', function(){
    console.log($('.m-filter option:selected').text());
  })

  $('.b-filter').on('change', function(){
    console.log($('.b-filter option:selected').text());
  })
});
