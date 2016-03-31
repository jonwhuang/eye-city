$(document).ready(function(){

  $('.m-filter').on('change', function(){
    var manufacturer = $('.m-filter option:selected').text();
    $.ajax({
      method: 'GET',
      url: '/filter',
      data: { 'manufacturer': manufacturer }
    }).done(function(response){
      console.log(response);
    })
  })

  $('.b-filter').on('change', function(){
    var brand = $('.b-filter option:selected').text();
    $.ajax({
      method: 'GET',
      url: '/filter',
      data: { 'brand': brand }
    }).done(function(response){
      console.log(response);
    })
  })
});
