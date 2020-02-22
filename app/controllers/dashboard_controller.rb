class DashboardController < ApplicationController
  def index;end

  def products;end
  
  def new_product;end 

  def create_product
  	@product = params[:products]
  	ProductMailer.send_new_product_to_support(@product).deliver_now
  	redirect_to root_path, notice: "Product added successfully"
  end
end
