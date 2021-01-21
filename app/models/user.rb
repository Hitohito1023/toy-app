class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  has_many :entries
  has_many :direct_messages
  has_many :rooms, through: :entries
end
