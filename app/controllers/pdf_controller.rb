class PdfController < ApplicationController

	before_filter :signed_in_user
	def new_quotation

    	@quotation = Quotation.find(params[:id])
	end

	def new_buy_order

    	@buy_order = BuyOrder.find(params[:id])
	end

	def create_quotation
		@quotation = Quotation.find(params[:id])
		@order=current_order
		@order.destroy
		session[:order_id]=nil
	    html = render_to_string(:layout => false , :template => "pdf/_quotation.html.erb")
	    kit = PDFKit.new(html, :page_size => 'Letter')
	    kit.stylesheets << "#{Rails.root}/public/assets/application.css"
	  
	    kit.to_file("#{Rails.root}/public/Cotizacion#{@quotation.id}.pdf")
	 
	    send_file "#{Rails.root}/public/Cotizacion#{@quotation.id}.pdf",
     		:type => "application/pdf",
    		:file_name => "Cotizacion#{@quotation.id}.pdf",
      		:disposition => 'inline',
       		:stream => false,
       		#:disable_smart_shrinking=> true,
    		#:disable_pdf_compression=> true,
    		:margin_top => '0.5in',
    		:margin_bottom => '0.5in',
    		:dpi =>'300'
      		
	end

	def create_buy_order
		@buy_order = BuyOrder.find(params[:id])
		@order=current_order
		
		session[:order_id]=nil
	    html = render_to_string(:layout => false , :template => "pdf/_buy_order.html.erb")
	    
	    kit = PDFKit.new(html, :page_size => 'Letter')
	    kit.stylesheets << "#{Rails.root}/public/assets/application.css"
	  
	    kit.to_file("#{Rails.root}/public/OrdenCompra#{@buy_order.id}.pdf")
		@order.destroy	 
	    send_file "#{Rails.root}/public/OrdenCompra#{@buy_order.id}.pdf",
     		:type => "application/pdf",
    		:file_name => "OrdenCompra#{@buy_order.id}.pdf",
      		:disposition => 'inline',
       		:stream => false,
       		#:disable_smart_shrinking=> true,
    		#:disable_pdf_compression=> true,
    		:margin_top => '0.5in',
    		:margin_bottom => '0.5in',
    		:dpi =>'300'
      		
	end


end
