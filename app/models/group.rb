class Group < ApplicationRecord
  include PointHelper
  include GroupsHelper

  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages, dependent: :destroy

  has_one :event, inverse_of: :group, dependent: :destroy
  accepts_nested_attributes_for :event

  validates :name, presence: true, length: { maximum: 12 }
  validates :genre, :border, presence: true

  def self.search(keyword, genre)
    return Group.all unless keyword && genre
    Group.where("genre = ? and name LIKE(?)", genre, "%#{keyword}%")
  end

  # def point_average
  #   self.diaries.average(:point).round(1)
  # end
end
