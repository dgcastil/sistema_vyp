class Order < ActiveRecord::Base
  attr_accessible :address, :email, :name, :rut, :sell_condition, :subtotal, :telephone
  has_many :order_items, dependent: :destroy
  
  before_save :update_subtotal



end
