  class Room < ApplicationRecord
    has_many :users, dependent: :destroy
    has_many :transactions, dependent: :destroy

    validates :name, :password, presence: true

    has_secure_password
  end
