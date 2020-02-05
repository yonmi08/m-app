class Diary < ApplicationRecord
  belongs_to :user

  validates :text, :date, presence: true
  validates :date, :uniqueness => {:scope => :user_id}
    
  scope :date_sort, -> {order(date: :desc)}
end