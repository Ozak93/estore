class Category < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_and_belongs_to_many :products
  belongs_to :user, -> {User.admin}
  enum name: [:clothes, :shoes, :bags, :pc_parts, :books, :hand_made]
end
