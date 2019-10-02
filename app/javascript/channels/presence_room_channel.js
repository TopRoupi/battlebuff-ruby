import consumer from "./consumer"

consumer.subscriptions.create("PresenceRoomChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    update_presence(data);
  }
});

function update_presence(data){
  $('#users').html('');
  data.forEach((item) => {
    print_player(item);
  });
}

function print_player(player){
  var player_html = `
  <li>
    <img class="avatar"
    src="${player.avatar_url}">
    ${player.nickname}
  </li>`;
  $('#users').append(player_html);
}