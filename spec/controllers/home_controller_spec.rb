# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:steam]
  end

  it 'renders the index template' do
    get :index
    expect(response).to render_template :index
  end

  it 'auth_callback redirects to root_path' do
    get :auth_callback
    expect(response).to redirect_to root_url
  end
end
