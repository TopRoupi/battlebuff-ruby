import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    console.log('live');
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $('#chat').append('<li>'+data.content+'</li>');
    console.log(data);
    // Called when there's incoming data on the websocket for this channel
  }
});

var submit_messages;

$(document).on('turbolinks:load', () => {
  submit_messages();
})

submit_messages = function (){
  $('#message_content').on('keydown', (event) => {
    if(event.keyCode === 13){

      $('input').click();
      event.target.value = '';
      event.preventDefault();
    }
  })
}

