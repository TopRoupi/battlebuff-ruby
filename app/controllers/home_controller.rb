class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => :auth_callback

  def index
    
  end

  def auth_callback
    auth = request.env['omniauth.auth']
    session[:current_user] = { :nickname => auth.info['nickname'],
                               :image => auth.info['image'],
                               :uid => auth.uid }
    redirect_to root_url
  end
end
