$(function() {
  function auto_updata(data){
    for (var i = 0; i < data.length; i++) {
      var add_message ="<li class='chat-message'>\
      <div class='chat-message__header clearfix'>\
        <p class='chat-message__name'>"+ data[i].nickname +"</p>\
        <p class='chat-message__time'>"+ data[i].date+"</p>\
      </div>\
      <p class='chat-message__body'>"+data[i].message+"</p>\
      </li>"

      var image ="<p class='chat-message__photo'><img class='text_image' src = " + data[i].image +"></p>"

      if (data[i].image != null){
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
        auto_updata(data);
        $('.chat-body').animate({scrollTop:$('.chat-body')[0].scrollHeight},'fast');
        console.log("更新されたでごわす");
      })
      .fail(function(){
      });
    },3000);
});
