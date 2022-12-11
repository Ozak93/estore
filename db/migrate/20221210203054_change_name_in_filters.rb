class ChangeNameInFilters < ActiveRecord::Migration[7.0]
  def change
    change_column :filters, :name, :integer, null: false
  end
end
