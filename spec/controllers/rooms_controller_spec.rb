require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
	describe 'GET #show' do
    it 'redirects to root if the room is full and player already have a connected' do
      room = create(:room, limit: 1)
      player = create(:player)

      session[:player_id] = player.id
      cookies.encrypted[:player_id] = player.id

      player.set_online_status_by_room(true, room.id)

      get :show, params: {id: room.id}
      expect(response).to redirect_to root_url
    end

    it 'redirects to root if the room is full' do
      room = create(:room, limit: 1)
      player = create(:player)
      player2 = create(:player)

      session[:player_id] = player.id
      cookies.encrypted[:player_id] = player.id

      player2.set_online_status_by_room(true, room.id)

      get :show, params: {id: room.id}
      expect(response).to redirect_to root_url
    end

    it 'redirects to root if the player already have a connected' do
      room = create(:room, limit: 10)
      player = create(:player)

      session[:player_id] = player.id
      cookies.encrypted[:player_id] = player.id

      player.set_online_status_by_room(true, room.id)

      get :show, params: {id: room.id}
      expect(response).to redirect_to root_url
    end

    it 'renders the show template' do
      room = create(:room)
      player = create(:player)

      session[:player_id] = player.id
      cookies.encrypted[:player_id] = player.id
      
      get :show, params: {id: room.id}
      expect(response).to render_template :show
    end
	end
end
