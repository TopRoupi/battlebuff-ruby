class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.create(msg_params)
    @message.player = current_player

    return unless @message.save

    ActionCable.server.broadcast 'room_channel', content: @message.content
  end

  private

  def msg_params
    params.require(:message).permit(:content)
  end
end
