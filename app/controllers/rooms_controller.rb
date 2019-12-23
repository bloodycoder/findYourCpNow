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
        id1 = params[:chat]["user2_id"].to_i
        id2 = current_user.id
        if id1<=id2
            room_name = id1.to_s + '_' + id2.to_s
        else
            room_name = id2.to_s + '_' + id1.to_s
        end 
        @room = Room.find_by(name:room_name)
        if(@room == nil)
            flag = true
            @room = Room.new
            @room.name = room_name
            @room.save
        end
        @room_message = RoomMessage.new room: @room
        @room_messages = @room.room_messages.includes(:user)
        render "index"
        #byebug
    end
end
