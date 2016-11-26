$(function() {
  function post_message(data){
    for (var i = 0; i < data.messages.length; i++) {
      var add_message ="<li class='chat-message'>\
      <div class='chat-message__header clearfix'>\
        <p class='chat-message__name'>"+ data.nicknames[i] +"</p>\
        <p class='chat-message__time'>"+ data.date[i]+"</p>\
      </div>\
      <p class='chat-message__body'>"+data.messages[i]+"</p>\
      </li>"

      var image ="<p class='chat-message__photo'><img class='text_image' src = " + data.images[i] +"></p>"

      if (data.images[i] != null){
        $('ul.chat-messages').append(add_message,image);
      }else{
        $('ul.chat-messages').append(add_message);
      };
    };
  };
  setInterval(function(){
    $.ajax({
        url: `chats` + `.json`,
        type: 'GET',
        dataType: 'json'
      })
      .done(function(data) {
        $('ul.chat-messages').empty();
        post_message(data);
        $('.chat-body').animate({scrollTop:$('.chat-body')[0].scrollHeight},'fast');
        console.log("更新されたでごわす");
      })
      .fail(function(){
      });
    },3000);
});
