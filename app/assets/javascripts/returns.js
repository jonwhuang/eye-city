$(document).ready(function(){

  $('.tab-pane').on('click', 'a.return-details', function(e){
    e.preventDefault();
    var url = $(this).attr('href');
    $.ajax({
      method: 'GET',
      url: url
    }).done(function(response){
      $('.modal .modal-body').html(response);
    });

    $('.modal').modal('show');
  })

  $('.m-filter').on('change', function(){
    var manufacturer = $('.m-filter option:selected').text();
    $.ajax({
      method: 'GET',
      url: '/filter',
      data: { 'manufacturer': manufacturer }
    }).done(function(response){
      $('.b-filter').val("Filter By Brand");
      showFilterResults(response);
    })
  })

  $('.b-filter').on('change', function(){
    var brand = $('.b-filter option:selected').text();
    $.ajax({
      method: 'GET',
      url: '/filter',
      data: { 'brand': brand }
    }).done(function(response){
      $('.m-filter').val("Filter By Manufacturer");
      showFilterResults(response);
    })
  })
});

var showFilterResults = function(data){
  $('#filter').html(data);
  startTablesorter();
  $('.return-tabs a[href="#filter"]').tab('show');
}
