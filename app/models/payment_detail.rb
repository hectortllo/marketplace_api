class PaymentDetail < ApplicationRecord
  belongs_to :product
  belongs_to :payment_control
end
