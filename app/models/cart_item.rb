class CartItem < ApplicationRecord
  belongs_to :end_user
  belongs_to :item

  def add_tax
    (self.price * 1.1).floor
  end

  def subtotal
    self.item.add_tax * self.amount
  end
end
