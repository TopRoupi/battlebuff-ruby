import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!")
    require("../channels/room_channel.js")
  }
}