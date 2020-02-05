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
}); 
