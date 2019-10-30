# frozen_string_literal: true

require 'rails_helper'

# TODO: eliminate the copy and paste of "redirects to root_path"

RSpec.describe SessionsController, type: :controller do
  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:steam]
  end

  describe 'GET/POST #create' do
    it 'set player_id on session' do
      get :create
      expect(session).to include(:player_id)
    end

    it 'set player_id on cookie' do
      get :create
      expect(cookies.encrypted[:player_id]).to eq(Player.last.id)
    end

    it 'redirects to root_path' do
      get :create
      expect(response).to redirect_to root_url
    end
  end

  describe 'GET #destroy' do
    it 'redirects to root_path' do
      get :destroy
      expect(response).to redirect_to root_url
    end

    it 'set player_id nil on sessions and cookies' do
      get :create
      get :destroy
      expect(session[:player_id]).to be_nil
      expect(cookies.encrypted[:player_id]).to be_nil
    end
  end

  describe 'GET #fake' do
    it 'generate new player' do
      expect { get :fake }.to change(Player, :count).by(1)
    end

    it 'set player_id on session' do
      get :fake
      expect(session).to include(:player_id)
    end

    it 'set player_id on cookie' do
      get :fake
      expect(cookies.encrypted[:player_id]).to eq(Player.last.id)
    end

    it 'redirects to root_path' do
      get :fake
      expect(response).to redirect_to root_url
    end
  end
end
