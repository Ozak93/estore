class OrderProductRecord < ApplicationRecord
  belongs_to :order
  belongs_to :product
  # belongs_to :store, :through => :product
  # validates :quantity, numericality:
end
