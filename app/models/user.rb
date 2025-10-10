class User < ApplicationRecord
  validates :name, length: {minimum: 3, maximum: 50}
  validates :username, length: {minimum: 6, maximum: 25}, format: {with: /[A-Za-z0-9]/}
  validates :email, format: {with: /[^(?.=*[A-Za-z]](?.=*[A-Za-z])+@[gmail | yahoo | hotmail]+\\.(?.=*[a-zA-Z])/}
  # validates :password, presence: true
end
