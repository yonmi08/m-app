class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages, dependent: :destroy
  has_one :event, inverse_of: :group, dependent: :destroy
  accepts_nested_attributes_for :event

  validates :name, :genre, :border, presence: true

  def self.search(search)
    return Group.all unless search
    # Group.where("genre = ?", params[:genre]).pluck(:name)
    genre_ids = Group.where("genre = ?", params[:genre]).pluck(:id)
    name_ids = Group.where("name LIKE (?)", "#{params[:name]}").pluck(:id)
    @groups = Group.where("id IN (?) or id IN(?)", genre_ids, name_ids)
  end

  def point_average
    self.diaries.average(:point).round(1)
  end
end