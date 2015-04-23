class DetalleFactura < Detalle
  attr_accessible :descuentoMonto, :indAgente, :indExe, :mntBaseFaena, :mntMargComer, :montoItem, :nmbItem, :prcConsFinal, :prcItem, :prcRef, :qtyItem, :qtyRef, :recargoMonto, :recargoPct, :unmdItem, :unmdRef
  belongs_to :factura
end