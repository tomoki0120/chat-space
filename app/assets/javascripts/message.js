function post_message(data){
  var add_message ="<li class='chat-message'>\
  <div class='chat-message__header clearfix'>\
        <p class='chat-message__name'>"+data.name+"</p>\
        <p class='chat-message__time'>"+data.date+"</p>\
      </div>\
      <p class='chat-message__body'>"+data.message+"</p>\
      </li>"
  $('ul.chat-messages').append(add_message);
};

$(function() {
  $('#new_post').on('submit', function(e) {
    e.preventDefault();
    var form = $(this);
    var post_url = form.prop('action');
    var form_data = form.get(0)
    var formdata = new FormData(form_data);
    $.ajax({
      url: post_url + '.json',
      type: 'post',
      dataType: 'json',
      data: formdata,
      contentType: false,
      processData: false,
    })
      .done(function(data){
        post_message(data)
        $('#new_post').get(0).reset();
        $("#submit_body").attr('disabled', false);
      })
      .fail(function(){
        alert("messageを入力してください");
        $("#submit_body").attr('disabled', false);
      });
  });
});

