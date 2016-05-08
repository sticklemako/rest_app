class Api::CustomersController < ApplicationController
  before_action :authenticate_api_user!
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
  	@customers = Customer.all
    render json: @customers, status: :ok
  end

  def show
    render json: @customer, status: :ok
  end

  def new
  	@customer = Customer.new
  end

  def edit

  end

  def create
  	@customer = Customer.new(customer_params)

  	respond_to do |format|
	  	if @customer.save
	  		format.json { render json: @customer, status: :ok}
	  	else
	  		format.json { render json: @customer.errors, status: :unprocessable_entity }
	  	end
	end
  end

  def update
  	respond_to do |format|
	  	if @customer.update(customer_params)
	  		format.json { render json: @customer, status: :ok }
	  	else
	  		format.json { render json: @customer.errors, status: :unprocessable_entity }
	  	end
	end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :addrline1, :addr_city, :addr_state, :addr_country, :addr_pincode, :phone_no, :note)
    end

end