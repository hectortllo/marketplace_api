class Product < ApplicationRecord
  belongs_to :category
  has_many :payment_details
  has_many :payment_control, through: :payment_details
end
