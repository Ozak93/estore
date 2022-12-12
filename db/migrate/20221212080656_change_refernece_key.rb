class ChangeReferneceKey < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :products, :stores
    add_foreign_key :products, :stores, on_delete: :cascade
  end
end
