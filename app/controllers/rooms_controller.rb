class RoomsController < ApplicationController
    def index
        @room = Room.find_by(name:"public_room")
        @room_message = RoomMessage.new room: @room
        @room_messages = @room.room_messages.includes(:user)
    end
    def create
        @myroom = Room.new
        @myroom.name = "public_room"
        @myroom.save
    end
    def show

    end
end
