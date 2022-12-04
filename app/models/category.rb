class Category < ApplicationRecord
  has_and_belongs_to_many :products
  enum name: [:category1, :category2]
end
