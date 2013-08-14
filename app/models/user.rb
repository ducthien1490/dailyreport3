class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  belongs_to :group

  
  has_many :answers
  #validate 
  validates :name, presence: true, length: { maximum: 50,minimum:5}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@framgia.com/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } 
  
  validates :password, length: { minimum: 6 }, presence: true ,:on => :create
  
  has_secure_password

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
