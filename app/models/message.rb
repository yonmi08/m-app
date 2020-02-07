class Message < ApplicationRecord
  include PointHelper

  belongs_to :group
  belongs_to :user
  validates :content, presence: true

end