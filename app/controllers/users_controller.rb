class UsersController < ApplicationController

  before_action :filter_example, only: [:index]
  before_action :find_id, except: [:index, :new]

  def filter_example
      flash[:notice] = "Welcome To CRUD application"
  end

  def find_id
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    # pry
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: "User created successfully"
    else 
      puts @user.errors.full_messages.inspect 
      render :new, status: :unprocessable_entity      
    end
  end

  def show
  end

  def edit
    
    render :edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def delete
  end

  def destroy
    if @user.destroy
      puts "Hello World"
      redirect_to users_path, status: :ok
      flash[:notice] = "User deleted successfully"
    else
      redirect_to users_path, status: :unprocessable_entity
      flash[:notice] = "Could not delete user"
    end
  end


  private

  def user_params
    params.require(:user).permit(:name,:email,:username, :password)
  end
end
