class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :message,presence: true
  mount_uploader :text_image, TextImageUploader
end
