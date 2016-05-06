class Api::OrdersController < ApplicationController
  before_action :authenticate_api_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
  	@orders = Order.all
    render json: @orders, status: :ok
  end

  def show

  end

  def new
  	@order = Order.new
  end

  def edit

  end

  def create
  	@order = Order.new(order_params)

  	respond_to do |format|
	  	if @order.save
	  		format.json { render json: @order, status: :ok}
	  	else
	  		format.json { render json: @order.errors, status: :unprocessable_entity }
	  	end
	end
  end

  def update
  	respond_to do |format|
	  	if @order.update(order_params)
	  		format.json { render json: @order, status: :ok }
	  	else
	  		format.json { render json: @order.errors, status: :unprocessable_entity }
	  	end
	end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:note, item_order_attributes: [:note, :quantity, :id])
    end

end