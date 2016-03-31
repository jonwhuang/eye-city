$(document).ready(function(){
  bindReturnListeners();
});

$(document).on('page:load', function(){
  bindReturnListeners();
})

var bindReturnListeners = function(){
  $('.tab-pane').on('click', 'a.return-details', showReturnDetails);
  $('.m-filter').on('change', manufacturerFilter);
  $('.b-filter').on('change', brandFilter);
}

var manufacturerFilter = function(){
  var manufacturer = $('.m-filter option:selected').text();
  $.ajax({
    method: 'GET',
    url: '/filter',
    data: { 'manufacturer': manufacturer }
  }).done(function(response){
    $('.b-filter').val("Filter By Brand");
    showFilterResults(response);
  })
}

var brandFilter = function(){
  var brand = $('.b-filter option:selected').text();
  $.ajax({
    method: 'GET',
    url: '/filter',
    data: { 'brand': brand }
  }).done(function(response){
    $('.m-filter').val("Filter By Manufacturer");
    showFilterResults(response);
  })
}

var showFilterResults = function(data){
  $('#filter').html(data);
  startTablesorter();
  $('.return-tabs a[href="#filter"]').tab('show');
}

var showReturnDetails = function(e){
  e.preventDefault();
  var url = $(this).attr('href');
  $.ajax({
    method: 'GET',
    url: url
  }).done(function(response){
    $('.modal-title').text('Return Info');
    $('.modal .modal-body').html(response);
    $('.modal').modal('show');
  });

}
