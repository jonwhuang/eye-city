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
})
