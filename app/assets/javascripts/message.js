$(function(){
  function buildHTML(message) {
    var html =  `<div class="message" message-id="${message.id}">
                  <div class="message__top">
                    <div class="message__top__name">
                      ${message.user_name}
                    </div>
                    <div class="message__top__date">
                      ${message.date}
                    </div>
                  </div>
                  <div class="message__text">
                    ${message.content}
                  </div>
                </div>`
    return html;
  }
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    console.log(this)
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.side__body__message').append(html);
      $('.side__body__message').animate({scrollTop: $('.side__body__message')[0].scrollHeight});
      $('form')[0].reset();
      $('.submit-btn').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
  
  // var reloadMessages = function() {
  //   last_message_id = $('.message:last').data("message-id");
  //   console.log('hello')
  //   $.ajax({
  //     //ルーティングで設定した通り/groups/id番号/api/messagesとなるよう文字列を書く
  //     url: "api/messages",
  //     type: 'get',
  //     dataType: 'json',
  //     data: {id: last_message_id}
  //   })
  //   // .done(function(messages) {
  //   //   if (messages.length ! == 0) {
  //   //     var insertHTTML = '';
  //   //     $.each(messages, function(i, message) {
  //   //       insertHTML += buildHTML(message)
  //   //     });
  //   //     $.each(messages, function(i, message) {
  //   //       insertHTML += buildHTML(message)
  //   //     });
  //   //   }
  //   // })
  // }
//   var reloadMessages = function() {
//     //カスタムデータ属性を利用し、ブラウザに表示されている最新メッセージのidを取得
//     last_message_id = $('.message:last').data("message-id");
//     $.ajax({
//       //ルーティングで設定した通り/groups/id番号/api/messagesとなるよう文字列を書く
//       url: "api/messages",
//       type: 'get',
//       dataType: 'json',
//       data: {id: last_message_id}
//     })
//     .done(function(messages) {
//       if (messages.length !== 0) {
//       var insertHTML = '';
//       //配列messagesの中身一つ一つを取り出し、HTMLに変換したものを入れ物に足し合わせる
//       $.each(messages, function(i, message) {
//         insertHTML += buildHTML(message)
//       });
//       $('.side__body__message').append(insertHTML);
//       $('.side__body__message').animate({ scrollTop: $('.side__body__message')[0].scrollHeight});
//       $("form")[0].reset();
//       $(".submit-btn").prop("disabled", false);
//     }
//     })
//     .fail(function() {
//       alert('メッセージの送信に失敗しました');
//     });
//   };
// if (document.location.href.match(/\/groups\/\d+\/messages/)) {
//   setInterval(reloadMessages, 7000);
// }
}); 