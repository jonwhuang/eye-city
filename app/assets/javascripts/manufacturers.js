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
})
