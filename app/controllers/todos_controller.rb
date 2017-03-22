class TodosController < ApplicationController

  def index
    @todos = Todo.all
  end

def create
  # if our ajax request works, we'll hit this binding at take a look at params!
  @todo = Todo.create(todo_params)
  respond_to do |format|
    # if the response fomat is html, redirect as usual
    format.html { redirect_to root_path }
    # if the response format is javascript, do something else...
    format.js { }
  end
end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    
    respond_to do |format|
    format.html { redirect_to root_path }
    format.js { }
  end  
end

def show
  redirect_to root_path
end

  private
    def todo_params
      params.require(:todo).permit(:description)
    end
end
