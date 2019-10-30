import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    print_message(data);
  }
});

var entityMap = {
  '&': '&amp;',
  '<': '&lt;',
  '>': '&gt;',
  '"': '&quot;',
  "'": '&#39;',
  '/': '&#x2F;',
  '`': '&#x60;',
  '=': '&#x3D;'
};

function escape_html(string) {
  return String(string).replace(/[&<>"'`=\/]/g, function (s) {
    return entityMap[s];
  });
}

function scroll_chat(){
  chat = document.getElementById('chat');
  chat.scrollTop = chat.scrollHeight;
}

function print_message(message){
  var name_tag = 'name'
  if ($('#player_uid').text() == message.player.uid){
    name_tag = 'my_name'
  }
  var message_html = `
  <li>
    <span id="${name_tag}">
      ${message.player.nickname}
    </span>
    : ${escape_html(message.content)}
  </li>`;
  $('#chat').append(message_html);
  scroll_chat();
}

// clear input when submit a message
function submit_messages(){
  $('#message_content').on('keydown', (event) => {
    if(event.keyCode === 13){
      $('input').click();
      event.target.value = '';
    }
  })
}

$(document).on('turbolinks:load', () => {
  submit_messages();

  // fix later
  // i don't know why it's working pls don't modify it
  setTimeout(() => {
    scroll_chat();
  }, 0.1);
})