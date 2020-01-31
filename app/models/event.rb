class Event < ApplicationRecord
  belongs_to :group, inverse_of: :event
end
