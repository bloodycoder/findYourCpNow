class Profile < ApplicationRecord
  belongs_to :user

  # for paperclip for file attachment functionality:
  has_attached_file :avatar, styles: { medium: "175x175#", thumb: "100x100#", tac: "20x20#" },
                             default_url: 'https://wx3.sinaimg.cn/mw690/515a7464ly1g8pj3k5sctj20sg0izqbz.jpg'
  validates_attachment_content_type :avatar, content_type: ["image/jpg", "image/jpeg", "image/png","image/gif"]

  validate  :birth_date_cannot_be_in_the_future
  validates :gender, length: { maximum: 100 }
  validates :location, length: { maximum: 255 }
  validates :bio, length: { maximum: 2000 }

  has_attached_file :cover, styles: { large: "851x358#" }
  validates_attachment_content_type :cover, content_type: ["image/jpg", "image/jpeg", "image/png","image/gif"]

  def birth_date_cannot_be_in_the_future
    errors.add(:birthday, "can't be in the future") if
    !birthday.blank? and birthday > Date.today
  end

  def profile_photo(size)
    if !self.avatar.exists? && self.user.image
      # This is the image from facebook/github if logged in that way.
      self.user.image
    else
      # This is the user's uploaded image, or the default if none exists
      case size
      when 'tac'    then self.avatar.url(:tac)
      when 'thumb'  then self.avatar.url(:thumb)
      when 'medium' then self.avatar.url(:medium)
      else self.avatar.url(:original)
      end
    end
  end

end
