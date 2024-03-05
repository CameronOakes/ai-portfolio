class Library < ApplicationRecord
  validates :user, presence: true
  validates :description, presence: true
  belongs_to :user
  has_many :bookmarks
  has_many_attached :photos
end
