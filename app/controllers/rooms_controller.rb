class RoomsController < ApplicationController
  before_action :set_room, only: %i[show]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.where(visible: true).all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @room = Room.find(params[:id])
    if @room.is_full? or current_player.presence_by_room(@room.id).online == true
      redirect_to "/"
    end
    @message = Message.new room: @room
    @messages = Message.where(room: @room).includes(:player).last(10)
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)
    @room.visible = true

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :limit)
  end
end
