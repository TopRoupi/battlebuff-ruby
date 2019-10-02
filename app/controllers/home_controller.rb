# frozen_string_literal: true

# Home Page Controller
class HomeController < ApplicationController
  def index
    @user = current_player
    @users = Player.online_players_by_room(1)
    @message = Message.new
    @messages = Message.joins(:player).last(10)
  end
end
