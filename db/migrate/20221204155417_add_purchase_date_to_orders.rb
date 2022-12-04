class AddPurchaseDateToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :purchase_date, :datetime
  end
end
