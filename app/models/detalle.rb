class Detalle < ActiveRecord::Base
  attr_accessible :descuentoMonto, :indAgente, :indExe, :mntBaseFaena, :mntMargComer, :montoItem, :nmbItem, :prcConsFinal, :prcItem, :prcRef, :qtyItem, :qtyRef, :recargoMonto, :recargoPct, :tpoDocLiq, :unmdItem, :unmdRef
  has_many :codigo_items, dependent: :destroy
end
