class User < ApplicationRecord
  belongs_to :room
  has_many :transactions, dependent: :destroy

  validates :name, :password, presence: true

  has_secure_password
end
