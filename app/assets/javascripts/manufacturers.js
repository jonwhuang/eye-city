$(document).on('page:load', function(){
  returnFormManufacturerListeners();
  showManufacturerBrands();
  editManufacturer();
  deleteManufacturer();
  highlightManufacturersBrands();
})

$(document).ready(function(){
  returnFormManufacturerListeners();
  showManufacturerBrands();
  editManufacturer();
  deleteManufacturer();
  highlightManufacturersBrands();
})

var returnFormManufacturerListeners = function(){
  $('.return-form').on('change','select#return_manufacturer_id', function(){
    showBrandSelect();
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
        showBrandSelect();
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

var showBrandSelect = function(){
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
}

var highlightManufacturersBrands = function(){
  $('.manufacturer-list').on('mouseover', '.m-row', function(){
    $(this).css('background-color', '#e5f2fb');
  }).on('mouseout', '.m-row', function(){
    $(this).css('background-color', 'initial');
  })

  $('.brand-list').on('mouseover', '.b-row', function(){
    $(this).css('background-color', '#e5f2fb');
  }).on('mouseout', '.b-row', function(){
    $(this).css('background-color', 'initial');
  })
}

var showManufacturerBrands = function(){
  $('.manufacturer-list').on('click', '.m-name', function(e){
    e.preventDefault();
    $('.m-row').removeClass('active');
    $(this).parents('.m-row').addClass('active');
    var url = $(this).find('a').attr('href');
    $.ajax({
      method: 'GET',
      url: url
    }).done(function(response){
      $('.brand-list').html(response);
      highlightManufacturersBrands();
    })
  })
}

var editManufacturer = function(){
  $('.manufacturer-list').on('ajax:success', 'a.edit-manufacturer', function(e, data){
    $('.modal-title').text('Edit Manufacturer');
    $('.modal .modal-body').html(data);
    $('.modal').modal('show');
  })
  highlightManufacturersBrands();
}

var deleteManufacturer = function(){
  $('.manufacturer-list').on('ajax:success', 'a.delete-manufacturer', function(e, data){
    $('.manufacturer-list').html(data);
    $('.brand-list').empty();
  })
  highlightManufacturersBrands();
}
