class User < ApplicationRecord
  paginates_per 5
  has_many :stores
  has_many :categories
  has_many :products, dependent: :destroy
  has_one_attached :image
  has_many :orders, through: :products
  has_many :order_product_records, through: :products
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: [:customer, :owner, :admin]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def latest_products
    self.products.order(created_at: :desc)
  end

  def store(_id)
    self.stores.where(id: _id).first
  end
end
