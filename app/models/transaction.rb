class Transaction < ApplicationRecord
  enum status: { authorized: 0, captured: 1, refunded: 2 }

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :currency, presence: true
end
