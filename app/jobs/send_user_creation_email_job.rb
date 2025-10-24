class SendUserCreationEmailJob
  include Sidekiq::Job

  def perform(user_id)
    # Do something
    UserMailer.welcome_mail(user_id).deliver_now
  end
end
