class PostsController < ApplicationController

  before_action :find_id, only: [:edit, :delete, :show, :update, :destroy]

  def find_id
    @post = Post.find(params[:id])
  end

  def index
    if params[:user_id].present?
      @posts = Post.where(user_id: params[:user_id])
    else
      @posts = Post.all
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def show
  end

  def delete
  end

  def destroy
    if @post.destroy
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :user_id)
  end
end