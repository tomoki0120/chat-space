class Post < ApplicationRecord

  belongs_to :user
  belongs_to :group
  validates :message,presence: true
  mount_uploader :text_image, TextImageUploader

  def post_date
    created_at.strftime("%Y/ %m/ %d %T")
  end

end
