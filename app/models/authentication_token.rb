class AuthenticationToken < ApplicationRecord
  belongs_to :user

  validates :token, :expires_at, presence: true

  before_validation :set_expires_at, on: :create
  before_validation :set_token, on: :create 

  def set_expires_at
    self.expires_at = Time.zone.now + 1.hour 
  end

  def set_token
    self.token = SecureRandom.hex(20)
  end
end
