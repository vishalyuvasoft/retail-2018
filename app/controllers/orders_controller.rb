class OrdersController < ApplicationController

	def index
		@orders = Order.all
	end

	def new
		@order = Order.new
	end

	def create
		order = Order.new(order_params)
		if order.save
			flash[:notice] = "Order created successfully"
			redirect_to orders_path
		else
			flash[:error] = order.errors.full_messages.to_sentence
			redirect_to :back
		end
	end

	def show
		@order = Order.find(params[:id])
	end

	private

	def order_params
		params.require(:order).permit(:order_number, order_items_attributes: [:item_name, :quantity, :cost, :sale_tax, :import_tax, :_destroy])
	end
end
