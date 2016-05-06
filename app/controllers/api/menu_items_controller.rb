class Api::MenuItemsController < ApplicationController
  before_action :authenticate_api_user!
  before_action :set_menu_item, only: [:show, :edit, :update, :destroy]
  before_action :get_menu_item_name, only: [:get_item]

  def index
  	@menu_items = MenuItem.all
  end

  def show

  end

  def new
  	@menu_item = MenuItem.new
  end

  def edit

  end

  def get_item
    render json: @menu_item, status: :ok
  end

  def create
  	@menu_item = MenuItem.new(menu_item_params)
    
  	respond_to do |format|
	  	if @menu_item.save
        if(category_params[:category])
          c = Category.where(:name => category_params[:category][:name]).take
          if c
            @menu_item.categories << c
          else
            @category = Category.new(category_params[:category])
            @menu_item.categories << @category
          end
          
        end
	  		format.json { render json: @menu_item, status: :ok}
	  	else
	  		format.json { render json: @menu_item.errors, status: :unprocessable_entity }
	  	end
	end
  end

  def update
  	respond_to do |format|
	  	if @menu_item.update(menu_item_params)
	  		format.json { render json: @menu_item, status: :ok }
	  	else
	  		format.json { render json: @menu_item.errors, status: :unprocessable_entity }
	  	end
	end
  end

  def destroy
    @menu_item.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_item
      @menu_item = MenuItem.find(params[:id])
    end

    def get_menu_item_name
      @menu_item = MenuItem.where(:item_name => params[:item_name])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_item_params
      params.require(:menu_item).permit(:item_name, :item_cost, :desc, :ingredient_list)
    end

    def category_params
      params.permit(category: [:name, :desc])
    end
end