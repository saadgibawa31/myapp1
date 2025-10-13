class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: "User created successfully"
    else 
      # puts @user.errors.full_messages.inspect 
      render :new, status: :unprocessable_entity      
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def delete
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy 
      # render js: "console.log('Hello World!!!');"
      puts "Hello World"
      redirect_to users_path
    end
  end



  private

  def user_params
    params.require(:user).permit(:name,:email,:username, :password)
  end
end
