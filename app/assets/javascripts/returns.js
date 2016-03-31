$(document).ready(function(){

  $('.m-filter').on('change', function(){
    var manufacturer = $('.m-filter option:selected').text();
    $.ajax({
      method: 'GET',
      url: '/filter',
      data: { 'manufacturer': manufacturer }
    }).done(function(response){
      showFilterResults(response);
      $('.b-filter').val("Filter By Brand");
    })
  })

  $('.b-filter').on('change', function(){
    var brand = $('.b-filter option:selected').text();
    $.ajax({
      method: 'GET',
      url: '/filter',
      data: { 'brand': brand }
    }).done(function(response){
      showFilterResults(response);
      $('.m-filter').val("Filter By Manufacturer");
    })
  })
});

var showFilterResults = function(data){
  $('#filter').html(data);
  startTablesorter();
  $('.return-tabs a[href="#filter"]').tab('show');
}
