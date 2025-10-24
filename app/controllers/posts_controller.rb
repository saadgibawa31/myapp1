class PostsController < ApplicationController

  before_action :find_id, only: [:edit, :delete, :show, :update, :destroy]

  def find_id
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
    if params[:user_id].present?
      @posts = Post.where(user_id: params[:user_id])
    end

    # pagination custom implementation

    # page = [params[:page].to_i, 1].max
    # @per_page = 2
    # @total_posts = Post.count
    # offset = (page - 1) * @per_page
    # @posts = Post.limit(@per_page).offset(offset) 

    #pagination implementation using gem

    @posts = @posts.paginate(page: params[:page], per_page: 3)
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
    @comments = Comment.where(post_id: @post)
    
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