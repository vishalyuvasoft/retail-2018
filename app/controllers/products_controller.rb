class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		product = Product.new(product_params)
		if product.save
			flash[:notice] = "Product created successfully"
			redirect_to products_path
		else
			flash[:error] = product.errors.full_messages.to_sentence
			redirect_to :back
		end
	end

	private

	def product_params
    params.require(:product).permit(:name, :price, :sale_tax, :import_tax)
  end

end
