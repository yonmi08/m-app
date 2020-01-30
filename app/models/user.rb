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
  validates :name, :email, presence: true

  def user_point
    
  end
end
