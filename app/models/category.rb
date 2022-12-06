class Category < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_and_belongs_to_many :products
  enum name: [:clothes, :shoes, :bags, :pc_parts, :books, :hand_made]
end
