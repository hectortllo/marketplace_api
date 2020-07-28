class AddUserToPaymentControl < ActiveRecord::Migration[5.2]
  def change
    add_reference :payment_controls, :user, foreign_key: true
  end
end
