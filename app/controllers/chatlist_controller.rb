class ChatlistController < ApplicationController

  def chat
    @friends = current_user.friends
  end

end
