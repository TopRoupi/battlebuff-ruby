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
    if current_player
      session.delete :player_id
      cookies.delete :player_id
    end
    redirect_to root_path
  end
end
