class Product < ApplicationRecord
  has_and_belongs_to_many :categories
  belongs_to :store
  belongs_to :user, -> { where role: [1, 2] }
  has_many :order_product_records
  has_many :orders, through: :order_product_records

  has_one_attached :image
  has_many_attached :pictures
  has_rich_text :body

  paginates_per 8

  scope :price_less_than, ->(value) { where('price < ?', value.val) }
  scope :price_more_than, ->(value) { where('price > ?', value.val) }
  scope :price_in_between, ->(values) { where(price: (values[:lower_val]..values[:upper_val])) }


  # filter_opts expects :filter_by (describes type of filtration), :filter_opts (hash that hold the filtration parameters).
  def self.filtered_and_paginated(page_num, filter_by = 'all', filter_opts = {})
    case filter_by
      # Category Filtration
    when 'category'  # filter_opts :category_id (category id :integer type) is expected.
      filtration_exceptions('category', filter_opts)  # raises an exception if filter_opts has wrong arguments
      Product.where(category_id: filter_opts[:category_id]).page page_num

      # Price Filtration
    when 'price'  # filter_opts :price_scope and :values key are expected.
      filtration_exceptions('price', filter_opts)  # raises an exception if filter_opts has wrong arguments
      case filter_opts[:price_scope] # :price_scope is one of [:price_less_than, :price_more_than, :price_in_between].
      when :price_less_than
        Product.price_less_than(filter_opts[:values]).page page_num # :values expects :val key, value is an integer for max price.
      when :price_more_than
        Product.price_more_than(filter_opts[:values]).page page_num # :values expects :val key, value is an integer for min price.
      else
        Product.price_in_between(filter_opts[:values]).page page_num #:values expects :lower_val and :upper_val keys, values are integers for price range.
      end

      # returns paginated products without filtration.
    else
      Product.latest.page page_num
    end
  end

  def filters
    [:lower, :higher]
  end

  private

  def filtration_exceptions(filter_type, opts = {})
    case filter_type
    when 'category'
      raise ArgumentError, "no category is selected" unless opts.include? :category_id
    when 'price'
      raise ArgumentError, 'no price scope is selected' unless Set[:price_scope, :values].subset? opts.keys.to_set
      raise ArgumentError, "unknown price scope #{opts[:price_scope].to_s} make sure its one of [:price_less_than, :price_more_than, :price_in_between]" unless [:price_less_than, :price_more_than, :price_in_between].include? opts[:price_scope]
      raise ArgumentError, "invalid price scope #{'value'.pluralize(opts[:values].length)}" unless opts[:price_scope] == :price_in_between and opts[:values].length == 1 or [:price_more_than, :price_less_than].include? opts[:price_scope] and opts[:values].length == 1
    else
    end
  end


end
