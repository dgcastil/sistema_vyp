class FacturasController < ApplicationController
	def new
		@factura=Factura.new
	end

	def create
		@factura = Factura.new(params[:factura])

	end
end
