class Message < ApplicationRecord
  include PointHelper

  belongs_to :group
  belongs_to :user
  validates :content, presence: true

  def date_filter(group, group_users)
    date =group_users.diaries.where(group.created_at < created_at )
    binding pry
  end
end