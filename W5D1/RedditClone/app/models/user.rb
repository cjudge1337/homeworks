# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  before_validation :ensure_session_token

  validates :username, :session_token, :password_digest, presence: true,
                                                         uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :subs
  has_many :posts, dependent: :destroy, inverse_of: :author

  attr_reader :password

  def self.generate_session_token
    SecureRandom::urlsafe_base64(128)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    user && user.valid_password?(password) ? user : nil
  end

  def valid_password?(password)
    digest = BCrypt::Password.new(self.password_digest)
    digest.is_password?(password)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def is_moderator?(subject)
    self.id == subject.user_id
  end

  private
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
end
