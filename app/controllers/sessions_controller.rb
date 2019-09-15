class SessionsController < ApplicationController
  # omniayth-steam does not provide the CSRF token
  skip_before_action :verify_authenticity_token, only: :create

  def create
    @player = Player.from_omniauth request.env['omniauth.auth']
    session[:player_id] = @player.id
    redirect_to root_path
  end

  def destroy
    if current_player
      session.delete(:player_id)
      flash[:success] = 'Goodbye!'
    end
    redirect_to root_path
  end
end
