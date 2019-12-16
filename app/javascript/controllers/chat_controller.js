import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    require("../channels/room_channel.js")
    // require("../channels/presence_room_channel.js")
  }
}