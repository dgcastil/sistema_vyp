class Product < ActiveRecord::Base
  attr_accessible :buy_price, :code, :name, :sell_price
end
