$(document).ready(function(){
  $('.return-form').on('change','select#return_manufacturer_id', function(){
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
    } else {
      $.ajax({
        method: 'GET',
        url: '/collection',
        data: { "name": option }
      }).done(function(response){
        $('.brand-select').html(response);
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
    }).fail(function(response){
      $('.manufacturer-errors').html('<p class="alert alert-danger">Name can\'t be blank</p>');
    })
  })
})
