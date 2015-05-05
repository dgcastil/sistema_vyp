PDFKit.configure do |config|
  
  if File.executable? '~/.apt/usr/local/bin/wkhtmltopdf'
    config.wkhtmltopdf = '~/.apt/usr/local/bin/wkhtmltopdf'
  end

  config.default_options = {
  :encoding=>"UTF-8",
  :page_size=>"Letter", #or "Letter" or whatever needed
  :margin_top=>"0.25in",
  :margin_right=>"0.5in",
  :margin_bottom=>"0.25in",
  :margin_left=>"0.5in",
  :disable_smart_shrinking=>false
  }
	
end