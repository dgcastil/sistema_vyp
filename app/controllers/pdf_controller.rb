class PdfController < ApplicationController

	def new

    	@quotation = Quotation.find_by_code(params[:code])

	end

	def create
	 	# Load the html to convert to PDF
	    html = File.read("#{Rails.root}/app/views/pdf/_pdf.html.erb")
	    # Create a new kit and define page size to be US letter
	    kit = PDFKit.new(html, :page_size => 'Letter')
	    kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/pdf.css.scss"
	  
	    
		pdf = kit.to_pdf
	    #kit.to_file("#{Rails.root}/public/example.pdf")
	    # Render the html
	    redirect_to orders_path
	end


end
