class OrderDetail < ApplicationRecord
  enum status: {
    unable: 0,
    waiting: 1,
    production: 2,
    done: 3
  }
  belongs_to :item
  belongs_to :order
end
