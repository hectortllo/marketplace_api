class PaymentControl < ApplicationRecord
  has_many :payment_details
  has_many :products, through: :payment_details
end
