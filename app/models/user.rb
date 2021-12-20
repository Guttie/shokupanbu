class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image

  has_many :shops, dependent: :destroy
  has_many :toasts, dependent: :destroy
  has_many :sandwiches, dependent: :destroy
end
