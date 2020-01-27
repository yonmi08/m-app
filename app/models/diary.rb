class Diary < ApplicationRecord
  belongs_to :group
  belongs_to :user
  validates :text, :date, presence: true
  validates :user_id, :uniqueness => {:scope => :date}
end
