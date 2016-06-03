class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  before_save {self.email = email.downcase}
  before_create :create_remember_token


  validates :name,    presence: true, length: { maximum: 15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,   presence: true,
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, length: { minimum: 6 }

  def should_generate_new_friendly_id?
    new_record?
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
