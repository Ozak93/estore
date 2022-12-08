class User < ApplicationRecord
  paginates_per 5
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: [:customer, :owner, :admin]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
