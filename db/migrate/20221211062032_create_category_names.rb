class CreateCategoryNames < ActiveRecord::Migration[7.0]
  def change
    create_table :category_names do |t|
      t.string :name , null: false, unique: true
      t.timestamps
    end
  end
end
