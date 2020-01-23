class Group < ApplicationRecord
  has_many :users
  has_many :messages
  has_many :diaries
  validates :name, :type, :border, presence: true
end
