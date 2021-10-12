class User < ApplicationRecord
  validates :user_name, :session_token, uniqueness: true, presence: true
  validates :password_digest, presence: true

  after_initialize :ensure_session_token

  has_many :cat_rental_requests,
    class_name: 'CatRentalRequest',
    foreign_key: :renter_id
    
  has_many :cats,
    through: :cat_rental_requests,
    source: :cat

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  def password=(password)
    #if using @, can access password_digest from html
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  #is_valid_pw
  def validates_password?(password)
    password_object = BCrypt::Password.new(self.password_digest)
    password_object.is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(user_name: username)
    if user && user.validates_password?(password)
      user
    else nil
    end
  end
end
