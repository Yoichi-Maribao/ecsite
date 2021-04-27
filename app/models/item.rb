class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_item
  has_many :orders, through: :order_details
  attachment :image

  def add_tax
    (self.price * 1.1).floor
  end

  def subtotal
    self.add_tax * self.amount
  end

end
