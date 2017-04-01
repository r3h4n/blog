class TutorialsController < ApplicationController
  before_action :find_tutorial, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:new, :edit]

  def index
    if params[:category].blank?
    @tutorials = Tutorial.all.order("created_at DESC") 
  else
    @category_id = Category.find_by(name: params[:category]).id
    @tutorials = Tutorial.where(:category_id => @category_id).order("created_at DESC")
    end
    
    @category = Category.all
  end
  
  def show
    if @tutorial.reviews.blank?
      @average = 0
    else
      @average = (@tutorial.reviews.average(:rating).round(2)).fdiv(5)
    end
  end

  def new
    @tutorial = current_user.tutorials.build
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end
  
  def create
    @tutorial = current_user.tutorials.build(tutorial_params)
    @tutorial.category_id = params[:category_id]
    if @tutorial.save
      redirect_to tutorials_path
    else
      render 'new'
    end
  end
  

  
  def edit
        @categories = Category.all.map{ |c| [c.name, c.id] }
  end
  
  def update
    @tutorial.category_id = params[:category_id]
    if @tutorial.update(tutorial_params)
      redirect_to tutorial_path(@tutorial)
    else
      render 'edit'
    end
  end
  
  def destroy
    @tutorial.destroy
    redirect_to tutorials_path
  end
  
  
  private
    def tutorial_params
      params.require(:tutorial).permit(:title, :description, :author, :category_id, :tutorial_img)
    end
  
    def find_tutorial
      @tutorial = Tutorial.find(params[:id])
    end
  
  
end