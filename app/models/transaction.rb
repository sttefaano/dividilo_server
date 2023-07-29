class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :amount, :description, presence: true
end
