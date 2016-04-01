$(document).ready(function(){
  $('select#return_brand_id').on('change', function(){
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
    })
  })
})
