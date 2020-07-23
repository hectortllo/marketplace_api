class CreatePaymentControls < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_controls do |t|
      t.float :total

      t.timestamps
    end
  end
end
