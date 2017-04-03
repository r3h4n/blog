class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end
  
  def show
    @reviews = Review.all
    
    find_tutorial
    if @tutorial.reviews.blank?
      @average = 0
    else
      @average = (@tutorial.reviews.average(:rating).round(2)).fdiv(5)
    end
  end
  
  def create
   @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      cookies.signed[:user_id] = @user.id
      flash[:success] = "Wecome #{@user.username} to Ruby on Ray's!"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  def edit
    set_user
  end
  
  def update
    set_user
    if @user.update(user_params)
      flash[:success] = "You account was updated succesfully"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    set_user
    @user.destroy
    flash[:success] = "User has been deleted"
    redirect_to root_path
  end
  
  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
  
   def set_user
    @user = User.find(params[:id])
  end
  
  def require_same_user
    if current_user != @user
      flash[:danger] = "You can only edit or delete your own account"
      redirect_to users_path
    end
  end
  
  def find_tutorial
     @tutorial = Tutorial.find(params[:id])
  end
  
end