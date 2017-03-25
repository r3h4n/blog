class CommentsController < ApplicationController

 def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      ActionCable.server.broadcast "comments", render(partial: 'comments/comment', object: @comment)
      # flash[:success] = "Comment was created successfully"
      # redirect_to article_path(@article)
    else
      flash[:danger] = "comment was not created"
    redirect_to :back
  end
end

 def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end


  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end