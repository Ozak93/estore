class Store < ApplicationRecord
  has_many :products
  has_many :order_product_records, through: :products
  belongs_to :user
  has_one_attached :image
  validates :name , presence: true, uniqueness: true
end
