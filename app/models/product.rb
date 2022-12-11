class Product < ApplicationRecord
  include ProductsFilters
  has_and_belongs_to_many :categories
  belongs_to :store
  belongs_to :user, -> { where role: [1, 2] }
  has_many :order_product_records
  has_many :orders, through: :order_product_records

  has_one_attached :image
  has_many_attached :pictures
  has_rich_text :body

  paginates_per 8

  scope :price_less_than, ->(value) { where('price < ?', value )}
  scope :price_more_than, ->(value) { where('price > ?', value) }
  scope :price_in_between, ->(values) { where(price: (values[:lower_val]..values[:upper_val])) }


  # filter_opts expects :filter_by (describes type of filtration), :filter_opts (hash that hold the filtration parameters).


end
