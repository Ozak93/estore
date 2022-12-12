class Category < ApplicationRecord
  validates :name, uniqueness: true
  has_and_belongs_to_many :products
  belongs_to :user, -> { User.admin }
  # enum name: [:clothes, :shoes, :bags, :pc_parts, :books, :hand_made]

  categories_names_hash = {}
  CategoryName.all.each_with_index do |category, index|
    categories_names_hash[category.name.to_sym] = index
  end

  categories_expandable_with(categories_names_hash)

end
