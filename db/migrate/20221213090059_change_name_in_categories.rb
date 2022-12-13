class ChangeNameInCategories < ActiveRecord::Migration[7.0]
  def change
    change_column :categories, :name, :string, null: false
  end
end
