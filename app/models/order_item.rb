class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  attr_accessible :quantity, :product_id

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  validate :product_present
  #validate :order_present

  private

  def product_present
    if product.nil?
      errors.add(:product, "is not valid or is not active.")
    end
  end
=begin

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end
=end
end