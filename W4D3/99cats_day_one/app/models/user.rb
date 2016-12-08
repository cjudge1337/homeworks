class User < ActiveRecord::Base
  validates :user_name, :password_digest, presence: true, uniqueness: true
  validates :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_sesssion_token

  attr_reader :password

  has_many :cats,
    primary_id: :id,
    foreign_id: :user_id,
    class_name: :Cat

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(128)
    self.save!
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  def is_password?(password)
    bc_obj = BCrypt::Password.new(password_digest)
    bc_obj.is_password?(password)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def ensure_sesssion_token
    self.session_token ||= SecureRandom.urlsafe_base64(128)
  end

end
