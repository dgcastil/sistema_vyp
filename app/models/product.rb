class Product < ActiveRecord::Base
  attr_accessible :buy_price, :code, :name, :sell_price
  has_many :order_items
  validates :name, presence: true
  validates :sell_price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :buy_price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :code, presence: true, uniqueness: true
	def self.search(search)
	  if search
	    where('name LIKE ?', "%#{search}%")
	  else
	    scoped
	  end
	end


end
