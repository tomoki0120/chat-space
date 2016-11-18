$(function() {

  var list = $("#user-search-result");
  var preWord;

  function appendList(user,i) {

    var item = '<div class = "chat-group-user chat-group-user-user clearfix"><p class="chat-group-user__name">' + user.nickname + '</p>\
        <a class = "user-search-add chat-group-user__btn chat-group-user__btn--add" \
       data-user_id = "' + user.id + '"\
       data-user_name = "' + user.nickname + '">追加</a></div>'

    if (user.nickname !== undefined){

      list.append(item);

      $('chat-group-user__btn--add,[data-user_id = "' + user.id + '"]').on('click',function(e){
        e.preventDefault();
        $('#chat-group-users').append('<div class= "chat-group-user clearfix"><input multiple="multiple" type="hidden" name="group[user_ids][]", value="'+ user.id + '">\
          <p class="chat-group-user__name">'+ user.nickname +'<a class="user-search-remove chat-group-user__btn chat-group-user__btn--remove" data-user-id="'+ user.id +'">削除</a></p>\
        </div>');
        $(this).closest('div').remove();
        $('.user-search-remove,[data-user-id="'+ user.id +'"]').on('click',function(e){
          e.preventDefault();
          $(this).closest('div').remove();
        });
      });
    };
  };

  function editElement(element) {
    var result = element + "+" ;
    return result;
  }

  $("#chat_user_name").on("keyup", function() {
    $('.chat-group-user-user').remove()
    var input = $(this).val();
    var inputs = input.split(" ").filter(function(e) { return e; });
    var newInputs = inputs.map(editElement);
    var word = newInputs.join("|");
    var reg = RegExp(word);
    var users = gon.users;

    if (word != preWord && input.length !== 0) {
      $.each(users, function(i,user) {
        var match_nickname = user.nickname.match(reg)
        if (match_nickname) {
          appendList(user);
        }
      });
    }
    preWord = word;
  });
});
