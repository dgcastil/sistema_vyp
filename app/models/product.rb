class Product < ActiveRecord::Base
  attr_accessible :buy_price, :code, :name, :sell_price
  has_many :order_items


	def self.search(search)
	  if search
	    where('name LIKE ?', "%#{search}%")
	  else
	    scoped
	  end
	end


end
