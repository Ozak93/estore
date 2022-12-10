class User < ApplicationRecord
  paginates_per 5
  has_many :stores
  has_many :categories
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: [:customer, :owner, :admin]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def self.latest_products
    self.products.order(created_at: :desc)
  end

  def store(_id)
    self.stores.where(id: _id).first
  end
end
