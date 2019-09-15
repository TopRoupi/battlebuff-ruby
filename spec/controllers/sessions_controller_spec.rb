# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:steam]
  end

  describe 'GET create' do
    it 'redirects to root_path' do
      get :create
      expect(response).to redirect_to root_url
    end
  end

  describe 'POST create' do
    it 'redirects to root_path' do
      post :create
      expect(response).to redirect_to root_url
    end
  end

  describe 'GET destroy' do
    it 'redirects to root_path' do
      get :destroy
      expect(response).to redirect_to root_url
    end
  end
end
