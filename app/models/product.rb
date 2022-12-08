class Product < ApplicationRecord
  has_and_belongs_to_many :categories
  belongs_to :store
  has_many :order_product_records
  paginates_per 5
end
