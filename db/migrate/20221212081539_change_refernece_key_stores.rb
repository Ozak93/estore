class ChangeReferneceKeyStores < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :stores, :users
    add_foreign_key :stores, :users, on_delete: :cascade

  end
end
