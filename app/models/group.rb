class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages
  # validates :name, :genre, :border, presence: true  1/27 グループ作成時、あるとできなかったので消しています。
end
