class ProductMailer < ApplicationMailer

	def send_new_product_to_support(product)
		@product = product
		mail(
		  # to: "support@technowand.com.au",
		  to: "kanakshrma52@gmail.com",
      subject: "New product is created.",
      from: "admin@vultrdemo.com"
    )
  end

end
