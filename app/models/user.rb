class User < ApplicationRecord
  has_many :posts
  after_commit :SendMail, on: :create

  def SendMail
    SendUserCreationEmailJob.perform_async(id)
  end
  
  validates( 
    :name, 
    length: {minimum: 3, maximum: 50, message: "Name should be minimum 3 characters"},
    presence: true
  )
  validates( 
    :username, 
    length: {minimum: 3, maximum: 25, message: "Username should contain minimum 6 characters"}, 
    format: {with: /[A-Za-z0-9_]/, message: "Username can only contain alphanumeric characters and _"}, 
    uniqueness: true
  )
  validates( 
    :email, 
    presence: true,
    format: {with: /(^[A-Za-z].*)[A-Za-z0-9]+@(gmail|yahoo|hotmail)+\.[a-zA-Z]{1,3}\z/,message: "Email is invalid"},
    uniqueness: true
  )
  validates( 
    :password,
    presence: true, 
    format: {with: /(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*_-])/}, 
  )
end
