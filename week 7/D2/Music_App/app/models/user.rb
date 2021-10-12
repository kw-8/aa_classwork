class User < ApplicationRecord
  validates :email, :password_digest, :session_token, presence: true
  validates :email, :session_token, uniqueness: true

  #after_initialization; only when saving
  before_validation :ensure_session_token

  #only in object, not db
  attr_reader :password

  def self.find_by_credentials(email, password)
    user = User.find_by(email: params[:email])
    if !user.nil? && is_valid_password?(password)
      user
    else
      nil # email or password is incorrect
    end
  end

  #-------- session token
  def self.generate_session_token #is this it???????
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save! #save user to database
    self.session_token
  end

  def ensure_session_token # runs before validation, in the process of saving
    self.session_token ||= User.generate_session_token
  end

  #-------- password
  def password=(new_password)
    @password_digest = BCrypt::Password.create(new_password)
    self.password_digest = @password_digest
  end

  def is_valid_password?(password) #normal str
                                    #hashed str -> pw obj
    pw_obj = BCrypt::Password.new(self.password_digest)
    
    # converts password -> obj and compares w pw_obj
    pw_obj.is_password?(password)
  end

end
