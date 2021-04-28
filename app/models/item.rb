class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_item
  has_many :orders, through: :order_details
  attachment :image

  with_options presence: true do
    validates :name
    validates :description
    validates :price
  end

  def self.search(search)
    if search
      Item.where(['name LIKE ?', "%#{search}%"])
    else
      Item.all
    end
  end

  private

  def add_tax
    (self.price * 1.1).floor
  end

  def subtotal
    self.add_tax * self.amount
  end

end
