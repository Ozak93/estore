class DropOrdersProductsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :orders_products
  end
end
