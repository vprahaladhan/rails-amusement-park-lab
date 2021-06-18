class RidesController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    session[:user_name] = @user.name
    redirect_to user_path(@user.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end

  def show
    @user = User.find_by_id(params[:id].to_i)
    if (session[:user_id].nil?) then
      redirect_to '/'
    end
  end

  def go_on_ride
    @ride = Ride.new(user_id: session[:user_id], attraction_id: params[:attraction_id])
    message = @ride.take_ride
    if message.include?('Thanks') then
      @ride.save
    end
    redirect_to user_path(session[:user_id], message: message)
  end

  private

  def user_params
    params.require(:user).permit(:name, :happiness, :nausea, :height, :tickets, :password, :admin)
  end
end
