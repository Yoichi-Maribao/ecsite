class Order < ApplicationRecord
  enum payment_method: {
    card: 0,
    bank: 1
  }

  enum status: {
    waiting: 0,
    paid: 1,
    production: 2,
    ready: 3,
    done: 4
  }

  belongs_to :end_user
  has_many :items, through: :order_details

  with_options presence: true do
    validates :postcode
    validates :address
    validates :name
  end

  def merge_address
    "〒#{self.postcode} #{self.address}\n" + self.end_user.last_name + self.end_user.first_name
  end

end