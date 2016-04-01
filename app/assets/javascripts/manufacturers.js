$(document).on('page:load', function(){
  returnFormListeners();
  showManufacturerBrands();
  editManufacturer();
})

$(document).ready(function(){
  returnFormListeners();
  showManufacturerBrands();
  editManufacturer();
})

var returnFormListeners = function(){
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
    if ($(this)[0].id === "new_manufacturer"){
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
    } else {
      var url = $(this).attr('action');
      $.ajax({
        method: 'PUT',
        url: url,
        data: data
      }).done(function(response){
        $('.manufacturer-list').html(response);
        $('.modal').modal('hide');
      }).fail(function(response){
        $('.manufacturer-errors').html('<p class="alert alert-danger">Name can\'t be blank</p>');
      })
    }
  })
}

var showManufacturerBrands = function(){
  $('.m-row').mouseover(function(){
    $(this).css('background-color', '#e5f2fb');
  }).mouseout(function(){
    $(this).css('background-color', 'initial');
  })

  $('.m-name').on('click', function(){
    debugger;
  })
}

var editManufacturer = function(){
  $('.manufacturer-list').on('ajax:success', 'a.edit-manufacturer', function(e, data){
    $('.modal-title').text('Edit Manufacturer');
    $('.modal .modal-body').html(data);
    $('.modal').modal('show');
  })
}

