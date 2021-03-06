class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.owner = current_user

    if @restaurant.save
      flash[:notice] = "You are now the proud owner of #{@restaurant.name}!"
      redirect_to restaurants_url
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reservation = @restaurant.reservations.build
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update_attributes(restaurant_params)
    if @restaurant.save
      flash[:notice] = "Restaurant #{@restaurant.name} has been updated."
      redirect_to restaurant_path(@restaurant)
    else
      flash[:alert] = "Unable to update #{@restaurant.name}."
      render :edit
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(
      :name,
      :address,
      :capacity,
      :timezone,
      :type_of_cuisine)
  end
end
