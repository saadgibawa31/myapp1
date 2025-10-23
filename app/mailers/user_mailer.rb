class UserMailer < ApplicationMailer
  def welcome_mail(user)
    @user = user
    mail(to: @user.email, subject: "Hi #{@user.name}! You have been registered on our application!!!")
  end
end
