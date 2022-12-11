class Filter < ApplicationRecord
  enum name: %i[low_price high_price medium_price category all_products]
  validates :name, uniqueness: true, presence: true
  has_many :categories
end
