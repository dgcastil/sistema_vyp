class FinderController < ApplicationController
	
	def new
		
		
	end

	def create
		@found_products=Product.find_by_id(params[:name])
		respond_to do |format|			
       		format.js
     	end
		
	end

end
