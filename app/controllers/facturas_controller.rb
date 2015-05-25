class FacturasController < ApplicationController
	require 'builder'
	def new
		@factura=Factura.new
	end

	def create

		@factura = Factura.new(params[:factura])
		if @factura.save

			
			xm = Builder::XmlMarkup.new(:ident=>1)
			xm.instruct!
			xm.DTE{
				xm.Documento("ID"=>"foo"){
					xm.folio("1")
					xm.RUTRecep(@factura.RUTRecep)
					xm.Encabezado{
						xm.GiroRecep(@factura.giroRecep)
					}	
				}
				xm.Signature("xmlns"=>"http://www.w3.org/2000/09/xmldsig#"){
					xm.SignedInfo{
						xm.CanonicalizationMethod("Algorithm"=>"http://www.w3.org/TR/2001/REC-xml-c14n-20010315")
						xm.SignatureMethod("Algorithm"=>"http://www.w3.org/2000/09/xmldsig#rsa-sha1")
						xm.Reference("URI"=>"#foo"){
							xm.DigestMethod("Algorithm"=>"http://www.w3.org/2000/09/xmldsig#sha1")
							xm.DigestValue	
						}
						
					}
					xm.SignatureValue

				}
			}
			
			sha1 = OpenSSL::Digest::SHA1.new
			digest = sha1.digest(xm.target!)
			private_key = OpenSSL::PKey::RSA.new(File.read("#{Rails.root}/public/key.pem"))
			firma=private_key.private_encrypt(digest)
			base64_firma=Base64.strict_encode64(firma)
			xm.firma(base64_firma)

			
			file = File.new("#{Rails.root}/public/Factura#{@factura.id}.xml", "wb")
			file.write(xm.target!)
			file.close

			
			#unsigned_xml = Nokogiri::XML(xm.target!)
			#file = File.new("#{Rails.root}/public/Factura#{@factura.id}.xml", "wb")
			#file.write(unsigned_xml)
			#file.close

			#unsigned_file= File.new("#{Rails.root}/public/Factura#{@factura.id}.xml")
			
			#private_key = OpenSSL::PKey::RSA.new(File.read("#{Rails.root}/public/key.pem"))
			#certificate = OpenSSL::X509::Certificate.new(File.read("#{Rails.root}/public/certificate.cer"))


			#unsigned_document = Xmldsig::SignedDocument.new(unsigned_file)
			#signed_xml = unsigned_document.sign(private_key)
			#file = File.new("#{Rails.root}/public/Factura#{@factura.id}.xml", "wb")
			#file.write(signed_xml)
			#file.close
		

			#signed_document = Xmldsig::SignedDocument.new(signed_xml)
			
			#if signed_document.validate(certificate)
				
				redirect_to root_path, notice: "Factura valida"
			#else	
				
			#	redirect_to root_path, notice: "Factura no valida"

			#end
			

		else
			redirect_to root_path
		end

	end
end
