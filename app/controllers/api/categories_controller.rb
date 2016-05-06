class Api::CategoriesController < ApplicationController
  before_action :authenticate_api_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
  	@categories = Category.all
  end

  def show

  end

  def new
  	@category = Category.new
  end

  def edit

  end

  def get_item
    render json: @category, status: :ok
  end

  def create
  	@category = Category.new(category_params)

  	respond_to do |format|
	  	if @category.save
	  		format.json { render json: @category, status: :ok}
	  	else
	  		format.json { render json: @category.errors, status: :unprocessable_entity }
	  	end
	end
  end

  def update
  	respond_to do |format|
	  	if @category.update(category_params)
	  		format.json { render json: @category, status: :ok }
	  	else
	  		format.json { render json: @category.errors, status: :unprocessable_entity }
	  	end
	end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :desc, menu_item_attributes: [:item_name, :item_cost, :id])
    end

end