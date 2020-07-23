class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_code
      t.string :product_name
      t.string :product_image
      t.float :product_price
      t.float :product_cost
      t.float :product_discount
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
