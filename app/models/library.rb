class Library < ApplicationRecord
  validates :user, presence: true
  validates :description, presence: true
  belongs_to :user
end
