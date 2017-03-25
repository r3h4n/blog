class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy] # run this line of code for show/edit/update before anything in the method below
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  # http_basic_authenticate_with name: "rehan", password: "secret", except: [:index, :show]

  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 3)
    @articles = @articles.reorder('created_at DESC')
    
    if params[:search]
      @articles = Article.search(params[:search]).paginate(:page => params[:page], :per_page => 3)
      @articles = @articles.reorder('created_at DESC')
    end
    
  end
  
  def show
    @comment = Comment.new
  @comments = @article.comments.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @article = Article.new
  end
  
  def edit
    set_article
  end
  
  def create 
      @article = Article.new(article_params)
      @article.user = current_user
      if @article.save
      flash[:notice] = "Post created successfully!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
  if @article.update(article_params)
    flash[:success] = "Post was updated successfully"
    redirect_to article_path(@article)
  else
    render 'edit'
  end
end

  def destroy
    set_article.destroy
   flash[:success] = "Post deleted successfully"
    redirect_to articles_path
  end

  private
  
    def article_params
      params.require(:article).permit(:title, :text)
    end
    
      def set_article
     @article = Article.find(params[:id])
  end
   
   def require_same_user
    if current_user != @article.user and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own recipes"
      redirect_to articles_path
    end
  end
    
end
