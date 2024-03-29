require 'openssl'

class User < ApplicationRecord

  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new 

  has_many :questions

  attr_accessor :password
  
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, alert: "Invalid email" }
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  validates :password, presence: true, on: :create
  validates :password, confirmation: true
  
  before_save :encrypt_password

  def encrypt_password
    if self.password.present? 
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(self.password, self.password_salt, ITERATIONS, DIGEST.length, DIGEST)
      )
    end

  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)
  
    if user.present? && user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST))
      user
    end
  end

  private 

  
  def is_mail_valid?(email)
    email =~ /^[A-Za-z0-9+_.-]+@([A-Za-z0-9]+\.)+[A-Za-z]{2,6}$/
  end
end
