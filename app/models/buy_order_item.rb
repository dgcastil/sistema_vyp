class BuyOrderItem < OrderItem

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.buy_price
    end
  end
end