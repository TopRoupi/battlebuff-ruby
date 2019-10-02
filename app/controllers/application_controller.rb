# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def current_player
    return nil unless session[:player_id]

    player ||= Player.find_by(id: session[:player_id])

    @current_player ||= player
  end

  helper_method :current_player
end
