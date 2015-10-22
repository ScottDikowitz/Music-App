# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  validates :email, :password_digest, :session_token, presence: true
  attr_reader :password
  after_initialize :ensure_session_token

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = generate_session_token
    self.save!
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::password.create(password)
  end

  def is_password?(password)
    BCrypt::password.create(self.password_digest).is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    if user
      if self.is_password?(user.password_digest)
        # return user if right credentials
        user
      end

    end
  end
end
