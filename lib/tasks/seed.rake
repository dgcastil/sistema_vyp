   
namespace :db do
	require 'csv' 
	desc "Fill database with data"
	task populate: :environment do
		csv_text = File.read("#{Rails.root}/lib/tasks/db.csv", {encoding: 'UTF-8'})
		

		csv = CSV.parse(csv_text, col_sep: ';', :headers => true)
		csv.each do |row|
			 
	   		Product.create!(row.to_hash)		

		end
	end
end