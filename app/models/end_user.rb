class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, :first_name, :kana_last_name, :kana_first_name, :postcode, :phone_number, presence: true
  has_many :cart_items
  has_many :orders
  has_many :addresses
end
