require 'sendgrid-ruby'
class ProductMailer < ApplicationMailer

	def sendgrid_instance
		SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
	end

	def root_url
		Rails.env.development? ? "http://localhost:3000" : "https://vultr-demo.herokuapp.com"
	end

	def send_new_product_to_support(product)

		puts "Sending product request.............."

		@product = product

		data = JSON.parse('{
      "from": {
        "email": "admin@vulter.com"
      },
      "personalizations": [
        {
          "dynamic_template_data": {
            "productServerName": "'+ "#{@product["server"]}" +'",
            "productServerLocation": "'+ "#{@product["server_location"]}" +'",
            "productServerType": "'+ "#{@product["server_type"]}" +'",
            "productServerSize": "'+ "#{@product["server_size"]}" +'"
          },  
          "to": [
            {
              "email": "support@technowand.com.au"
            }
          ]
        }
      ],
      "template_id":"d-c7a2eb33803d49acb54a73f34147d881"
    }')
    response = sendgrid_instance.client.mail._("send").post(request_body: data)
  end

end
