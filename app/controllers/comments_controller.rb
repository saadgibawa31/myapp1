class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(comments_param)
    if @comment.save
      redirect_to comments_path, status: :ok
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update
      redirect_to comments_path, status: :ok
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def delete
    @comment = Comment.find(params[:id])
  end

  def destroy
    if @comment.destroy
      redirect_to comments_path, status: :ok, notice: "Comment deleted successfully"
    else
      redirect_to comments_path, status: :unprocessable_entity, notice: "Comment could not be deleted"
    end
  end


  private

  def comments_param
    params.require(:comment).permit(:description, :post_id)
  end

end