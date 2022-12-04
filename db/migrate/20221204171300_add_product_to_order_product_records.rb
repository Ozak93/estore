class AddProductToOrderProductRecords < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_product_records, :product, null: false, foreign_key: true
  end
end
