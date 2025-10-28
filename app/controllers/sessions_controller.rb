class SessionsController < ApplicationController

  def new
  end

  def create
    
    @user = User.find_by(email: params[:email].downcase)
    if @user
      puts @user
      if @user.authenticate(params[:password])
        reset_session
        session[:current_user_id] = @user.id
        redirect_to posts_path, notice: "Signed in"
      else
        flash.now[:alert] = "Incorrect Email Or Password"
        render :new, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = "Incorrect Email or Password"
      render :new, status: :unprocessable_entity
    end

  end

  def destroy
    reset_session
    redirect_to root_path
  end

end