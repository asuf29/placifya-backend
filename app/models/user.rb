class User < ApplicationRecord
  has_secure_password
  has_many :authentication_tokens, dependent: :destroy
  
  validates :first_name, :last_name, :username, :email, presence: true
  validates :email, uniqueness: true
  validates :username, uniqueness: true
end
