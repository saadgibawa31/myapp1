class UserMailer < ApplicationMailer
  def welcome_mail(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: "Hi #{@user.name}! You have been registered on our application!!!")
  end
end
