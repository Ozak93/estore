class Filter < ApplicationRecord
  enum name: %i[low_price high_price medium_price category date]
  validates :name, uniqueness: true, presence: true
  has_many :categories
end
