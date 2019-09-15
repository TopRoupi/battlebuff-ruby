# frozen_string_literal: true

# Home Page Controller
class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :auth_callback

  def index; end
end
