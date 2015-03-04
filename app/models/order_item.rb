class OrderItem < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  attr_accessible :product_references, :quantity# :unit_price

  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present

 # before_save :finalize


=begin
  def total_price
    unit_price * quantity
  end
=end
private
  def product_present
    if product.nil?
      errors.add(:product, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end
=begin
  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
=end

end
