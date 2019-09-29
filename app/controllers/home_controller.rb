# frozen_string_literal: true

# Home Page Controller
class HomeController < ApplicationController
  def index
    @user = current_player
    @users = Player.all.where online: true
    @message = Message.new
    @messages = Message.joins(:player).last 10
  end
end
