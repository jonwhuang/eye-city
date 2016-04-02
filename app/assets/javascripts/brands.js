$(document).ready(function(){
  returnFormBrandListeners();
  editBrand();
  deleteBrand();
})

$(document).on('page:load', function(){
  returnFormBrandListeners();
  editBrand();
  deleteBrand();
})


var returnFormBrandListeners = function(){
  $('.return-form').on('change', 'select#return_brand_id', function(){
    var option = $('select#return_brand_id option:selected').text();
    if (option === 'Create New...'){
      $.ajax({
        method: 'GET',
        url: '/brands/new'
      }).done(function(response){
        $('.modal-title').text('New Brand');
        $('.modal .modal-body').html(response);
        $('.modal').modal('show');
      })
    }
  })

  $('.modal').on('submit', '.brand-form form', function(e){
    e.preventDefault();
    if ($(this)[0].id === "new_brand"){
      var manufacturer = $('select#return_manufacturer_id option:selected').text();
      var data = $(this).serialize() + '&manufacturer=' + manufacturer;
      var brand = $(this)[0][2].value;
      $.ajax({
        method: 'POST',
        url: '/brands',
        data: data
      }).done(function(response){
        $('.brand-select').html(response);
        $('.brand-select-menu option').filter(function(){
          return $.trim( $(this).text() ) == brand;
        }).attr('selected', 'selected');
        $('.modal').modal('hide');
      }).fail(function(response){
        console.log(response);
        $('.brand-errors').html('<p class="alert alert-danger">Name ' + response.responseJSON.name[0] + '</p>');
      })
    } else {
      var manufacturer = $('.m-row.active').children()[0].innerText;
      var data = $(this).serialize() + '&manufacturer=' + manufacturer;
      var url = $(this).attr('action');
      $.ajax({
        method: 'PUT',
        url: url,
        data: data
      }).done(function(response){
        $('.brand-list').html(response);
        $('.modal').modal('hide');
      }).fail(function(response){
        console.log(response);
        $('.brand-errors').html('<p class="alert alert-danger">Name ' + response.responseJSON.name[0] + '</p>');
      })
    }
  })
}

var editBrand = function(){
  $('.brand-list').on('ajax:success', 'a.edit-brand', function(e, data){
    $('.modal-title').text('Edit Brand');
    $('.modal .modal-body').html(data);
    $('.modal').modal('show');
  })
}

var deleteBrand = function(){
  $('.brand-list').on('click', 'a.delete-brand', function(e){
    if(confirm("Are you sure? This will also delete all associated returns.")){
      var manufacturer = $('.m-row.active').children()[0].innerText;
      var url = $(this).attr('href');
      $.ajax({
        method: 'DELETE',
        url: url,
        data: { 'manufacturer': manufacturer}
      }).done(function(response){
        $('.brand-list').html(response);
      })
      return false;
    } else {
      return false;
    }
  })
}
