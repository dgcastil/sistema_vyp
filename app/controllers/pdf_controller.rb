class PdfController < ApplicationController

	before_filter :signed_in_user
	def new

    	@order = current_order
	end

	def create
		@order = current_order
		
		session[:order_id]=nil
	    html = render_to_string(:layout => false , :template => "pdf/_quotation.html.erb", :formats => :html)
	    # Create a new kit and define page size to be US letter
	    kit = PDFKit.new(html, :page_size => 'Letter')
	    kit.stylesheets << "#{Rails.root}/public/assets/application.css"

	  
	    
		#pdf = kit.to_pdf

	    kit.to_file("#{Rails.root}/public/Cotizacion#{@order.id}.pdf")
	 
	    send_file "#{Rails.root}/public/Cotizacion#{@order.id}.pdf",
     		:type => "application/pdf",
    		:file_name => "Cotizacion#{@order.id}.pdf",
      		:disposition => 'inline',
       		:stream => false,
       		:disable_smart_shrinking=> true,
    		:disable_pdf_compression=> true,
    		:dpi =>'300'
      		
	end


end
