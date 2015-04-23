class CodigoItem < ActiveRecord::Base
  attr_accessible :tpoCodigo, :vlrCodigo
  belongs_to :detalle
end
