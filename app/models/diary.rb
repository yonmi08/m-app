class Diary < ApplicationRecord
  belongs_to :user
  validates :text, :date, :point, presence: true
  validates :date, :uniqueness => {:scope => :user_id}
    
  scope :date_sort, -> {order(date: :desc)}
end