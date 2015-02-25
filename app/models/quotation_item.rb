class QuotationItem < OrderItem

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.sell_price
    end
  end
end