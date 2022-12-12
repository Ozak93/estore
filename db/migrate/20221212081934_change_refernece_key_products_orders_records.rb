class ChangeReferneceKeyProductsOrdersRecords < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :order_product_records, :products
    add_foreign_key :order_product_records, :products, on_delete: :cascade

  end
end
