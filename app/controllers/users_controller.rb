class UsersController < ApplicationController
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  
  def new
    @user = User.new
  end
  
  def create
   @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Wecome #{@user.username} to Ruby on Ray's!"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "You account was updated succesfully"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User has been deleted"
    redirect_to root_path
  end
  
  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
  
  def require_same_user
    if current_chef != @chef
      flash[:danger] = "You can only edit or delete your own account"
      redirect_to users_path
    end
  end
  
  
end