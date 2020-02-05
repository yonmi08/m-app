class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :messages
  has_many :diaries
  has_many :events

  validates :name, presence: true, length: { maximum: 12 }
  validates :email, presence: true

  def point_average
    self.diaries.average(:point).round(1)
  end
end
