$(document).ready(function(){
  $('select#return_manufacturer_id').on('change', function(){
    var option = $('select#return_manufacturer_id option:selected').text();
    if (option === 'Create New...'){
      $.ajax({
        method: 'GET',
        url: '/manufacturers/new'
      }).done(function(response){
        $('.modal-title').text('New Manufacturer');
        $('.modal .modal-body').html(response);
        $('.modal').modal('show');
      })
    }
  })

  $('.modal').on('submit', '.manufacturer-form form', function(e){
    e.preventDefault();
    var data = $(this).serialize();
    var manufacturer = $(this)[0][2].value;
    $.ajax({
      method: 'POST',
      url: '/manufacturers',
      data: data
    }).done(function(response){
      $('.manufacturer-select').html(response);
      $('.manufacturer-select-menu option').filter(function(){
        return $.trim( $(this).text() ) == manufacturer;
      }).attr('selected', 'selected');
      $('.modal').modal('hide');
    })
  })
})
