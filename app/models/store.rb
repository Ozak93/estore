class Store < ApplicationRecord
  has_many :products
  has_many :order_product_records, through: :products
end
