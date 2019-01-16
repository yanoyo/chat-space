$(function() {
  function buildHTML(message){
    var image = message.image ? `<img src="${ message.image }" class="chat-main__message-image" />` : "";
    var html =   `<div class="chat-main__message" data-id= "${ message.id }">
                    <div class="chat-main__message-name">
                    ${ message.user_name }
                    </div>
                    <div class="chat-main__message-time">
                    ${ message.time }
                    </div>
                    <div class="chat-main__message-content">
                    ${ message.content }
                    </div>
                    ${ image }
                  </div>`
    return html;
  }

  $('#new_message').on("submit", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
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
      $('.chat-main__list').append(html);
      $('#new_message')[0].reset();
      $('.chat-main__footer__submit').prop('disabled', false);
      $('.chat-main__content').animate({ scrollTop: $('.chat-main__content')[0].scrollHeight }, 'fast');
    })
    .fail(function(){
      alert('error');
    })
  });

  var interval = setInterval(function(){
  if (window.location.href.match(/\/groups\/\d+\/messages/)) {
    var id = $('.chat-main__message:last').data('id');
    $.ajax ({
      url: location.href,
      type: 'GET',
      data: { id: id },
      dataType: 'json'
    })
    .done(function(messages){
      messages.forEach(function(message){
        $('.chat-main__list').append(buildHTML(message));
        $('.chat-main__content').animate({ scrollTop: $('.chat-main__content')[0].scrollHeight }, 'fast');
      });
    })
    .fail(function(data){
      alert('自動更新に失敗しました');
    })
  } else {
    clearInterval(interval);
  }}, 5000);
});
