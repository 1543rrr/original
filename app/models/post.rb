class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos

  has_many :photos
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 500 }
  
end
