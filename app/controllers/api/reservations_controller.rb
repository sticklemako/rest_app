class Api::ReservationsController < ApplicationController
  before_action :authenticate_api_user!
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def index
  	@reservations = Reservation.all
    render json: @reservations, status: :ok
  end

  def show
    render json: @reservation, status: :ok
  end

  def new
  	@reservation = Reservation.new
  end

  def edit

  end

  def create
  	@reservation = Reservation.new(reservation_params)
    if(reservation_params[:customer_id])
      c = Customer.find(reservation_params[:customer_id])
      c.reservations << @reservation
    end

  	respond_to do |format|
	  	if @reservation.save
	  		format.json { render json: @reservation, status: :ok}
	  	else
	  		format.json { render json: @reservation.errors, status: :unprocessable_entity }
	  	end
	end
  end

  def update
  	respond_to do |format|
	  	if @reservation.update(reservation_params)
	  		format.json { render json: @reservation, status: :ok }
	  	else
	  		format.json { render json: @reservation.errors, status: :unprocessable_entity }
	  	end
	end
  end

  def destroy
    @reservation.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:time_start, :time_end, :no_ppl, :type, :note, :customer_id)
    end

end