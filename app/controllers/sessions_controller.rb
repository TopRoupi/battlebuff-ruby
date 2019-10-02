class SessionsController < ApplicationController
  # omniayth-steam does not provide the CSRF token
  skip_before_action :verify_authenticity_token, only: :create

  def create
    @player = Player.from_omniauth request.env['omniauth.auth']
    session[:player_id] = @player.id
    cookies.encrypted[:player_id] = @player.id
    redirect_to root_path
  end

  def fake
    @player = Player.create(
      uid: Faker::Internet.uuid,
      nickname: Faker::Name.first_name,
      avatar_url: Faker::Avatar.image,
      profile_url: 'https://steamcommunity.com/id/lol'
    )
    session[:player_id] = @player.id
    cookies.encrypted[:player_id] = @player.id
    redirect_to root_path
  end

  def destroy
    player_id = current_player.id
    if current_player
      session.delete :player_id
      cookies.delete :player_id
    end
    redirect_to root_path
    ActionCable.server.remote_connections.where(current_player: player_id).disconnect
  end
end
