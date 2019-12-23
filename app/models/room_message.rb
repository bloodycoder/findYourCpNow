class RoomMessage < ApplicationRecord
  belongs_to :room, inverse_of: :room_messages
  belongs_to :user
  def as_json(options)
    #byebug
    #super(options).merge()
    full_name = ""
    full_name = full_name<<user.first_name<<" "<<user.last_name
    super(options).merge(user_full_name: full_name,user_avatar_url: user.profile.profile_photo('tac'))
  end
end
