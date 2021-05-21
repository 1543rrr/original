class Post < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :likes
  has_many :comments
end
