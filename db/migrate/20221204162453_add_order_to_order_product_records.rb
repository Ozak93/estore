class AddOrderToOrderProductRecords < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_product_records, :order, null: false, foreign_key: true
  end
end
