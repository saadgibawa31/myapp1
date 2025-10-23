class CommentsController < ApplicationController
  
  # before_action :find_id, only: [:edit, :update, :show, :delete, :destroy]
  before_action :find_id, only: %i[edit update show delete destroy]


  def find_id
    @comment = Comment.find(params[:id])
  end

  def index
    if params[:post_id].present?
      @comments = Comment.where(post_id: params[:post_id])
    else
      @comments = Comment.all
    end
  end

  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to comments_path
      flash[:notice] = "Comment added successfully"
    else
      render :new, status: :unprocessable_entity
      flash[:notice] = "Couldn't add comment"
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to comments_path
      flash[:notice] = "Comment Updated Successfully!!"
    else
      render :edit, status: :unprocessable_entity
      flash[:notice] = "Couldn't update comment"
    end
  end

  def show
  end

  def delete
  end

  def destroy
    if @comment.destroy
      redirect_to comments_path 
      flash[:notice] = "Comment deleted successfully"
    else
      redirect_to comments_path, status: :unprocessable_entity
      flash[:notice] = "Comment could not be deleted"
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:description, :post_id)
  end

end