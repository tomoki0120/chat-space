$(function(){
  var user = $('#delete_user_name').attr('value');
  $('.user-search-remove,[data-user-id="'+ user.id +'"]').on('click',function(e){
    e.preventDefault();
    $(this).closest('div').remove();
  });
});
