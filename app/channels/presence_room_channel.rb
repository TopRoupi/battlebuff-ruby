class PresenceRoomChannel < ApplicationCable::Channel
  def subscribed
    p 'a user connected 2'
  end

  def unsubscribed
    p 'a user disconnected 2'
  end
end
