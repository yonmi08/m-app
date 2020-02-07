class Event < ApplicationRecord
  belongs_to :group, inverse_of: :event
  
  validates :fail_text, :pass_text, presence: true
end
