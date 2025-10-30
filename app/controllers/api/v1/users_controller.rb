class Api::V1::UsersController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :find_id, only: [:show, :update, :destroy]

  def index
    users = User.all

    render json: users
  end

  def create 
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else 
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def show
    # user = User.find_by(id: params[:id])
    render json: @user
  end

  def update
    # user = User.find_by(id: params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      render json:{message: 'User deleted Succesfully'}
    else
      render json:{message: "Couldnt delete user"}, status: :unprocessable_entity
    end
  end

  protected

  def user_params
    params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
  end

  def find_id
    @user = User.find_by(id: params[:id])
  end
    


end