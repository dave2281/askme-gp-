class User < ApplicationRecord

  has_many :questions
  
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true


end
