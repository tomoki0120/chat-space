class Group < ApplicationRecord
  has_many :user_groups, dependent: :destroy
  has_many :users, through: :user_groups
  accepts_nested_attributes_for :users, allow_destroy: true
  has_many :posts

end
