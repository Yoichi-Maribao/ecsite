class Address < ApplicationRecord
  belongs_to :end_user
  validates :postcode, presence: true,
                       length: { minimum: 7, maximum: 7}
  validates :address, presence: true
  validates :name, presence: true

  def unite
    "〒#{self.postcode} #{self.address} #{self.name}"
  end

end
