class Order < ApplicationRecord
  has_many :order_product_records
  has_many :products, through: :order_product_records
  belongs_to :users
end
