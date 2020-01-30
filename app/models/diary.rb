class Diary < ApplicationRecord
  belongs_to :user
  validates :text, :date, presence: true
  validates :user_id, :uniqueness => {:scope => :date}

  scope :date_sort, -> {order(date: :desc)}
end