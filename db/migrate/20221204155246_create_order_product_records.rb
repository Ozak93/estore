class CreateOrderProductRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :order_product_records do |t|
      t.float :price
      t.integer :quantity

      t.timestamps
    end
  end
end
