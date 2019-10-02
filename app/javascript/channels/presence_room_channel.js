import consumer from "./consumer"

consumer.subscriptions.create("PresenceRoomChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    update_presence(data)
  }
});

function update_presence(data){
  $('#users').html('');
  data.forEach((item) => {
    $('#users').append('<li>'+item.nickname+'</li>');
  });
}