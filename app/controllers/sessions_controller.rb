class SessionsController < ApplicationController
  def new
    @users = User.all.map {|u| u.name}
    @user = User.new
  end

  def create
    puts "Params >> #{params}"
    @user = User.find_by(name: params[:user][:name])
    if (!@user.nil?) then
      puts "User >> #{@user.id}, #{@user.name}"
    else
      puts "User is not found!!"
    end
    if !@user.nil? && @user.authenticate(params[:password]) then
      session[:user_id] = @user.id
      session[:user_name] = @user.name
      session[:admin] = @user.admin
      redirect_to user_path(@user.id) 
    else
      redirect_to new_session_path
      # head(:forbidden)
    end
  end

  def edit
  end

  def update
  end

  def destroy
    session.delete :user_id
    session.delete :user_name
    redirect_to root_path
  end

  def index
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
