class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.create(msg_params)
    @message.player = current_player

    return unless @message.save

    ActionCable.server.broadcast "room_#{@message.room.id}_channel", content: @message.content, player: @message.player
  end

  private

  def msg_params
    params.require(:message).permit(:content, :room_id)
  end
end
