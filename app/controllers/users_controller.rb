class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(id: " ", name: " ", email: " ", username: " ", password: " ")

    if @user.save
      redirect_to @user, notice: "User created successfully"
    else 
      render :new, notice: "Issue in creating user"
    end
  end

end
