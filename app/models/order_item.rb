class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  attr_accessible :quantity, :product_id

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  validate :product_present
  #validate :order_present

  def sell_total
    product.sell_price*quantity
  end

  def buy_total
    product.buy_price*quantity
  end

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



end
