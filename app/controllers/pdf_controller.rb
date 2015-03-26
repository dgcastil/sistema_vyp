class PdfController < ApplicationController

	def new

    	@order = current_order
    	
    

	end

	def create
		@order = current_order
		session[:order_id]=nil
	    html = render_to_string(:layout => false , :template => "pdf/_pdf.html.erb", :formats => :html)
	    # Create a new kit and define page size to be US letter
	    kit = PDFKit.new(html, :page_size => 'Letter')
	    kit.stylesheets << "#{Rails.root}/public/assets/application.css"

	  
	    
		#pdf = kit.to_pdf

	    kit.to_file("#{Rails.root}/public/example.pdf")
	 
	    send_file "#{Rails.root}/public/example.pdf",
     		:type => "application/pdf",
    		:file_name => "example.pdf",
      		:disposition => 'inline',
       		:stream => false,
       		:disable_smart_shrinking=> true,
    		:disable_pdf_compression=> true,
    		:dpi =>'300'
      		
	end


end
