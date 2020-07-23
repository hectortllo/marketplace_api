class CreatePaymentDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_details do |t|
      t.datetime :date
      t.float :credit
      t.float :payment
      t.references :product, foreign_key: true
      t.references :payment_control, foreign_key: true

      t.timestamps
    end
  end
end
