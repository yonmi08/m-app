class Diary < ApplicationRecord
  belongs_to :group
  belongs_to :user
  validates :text, :date, presence: true
end
