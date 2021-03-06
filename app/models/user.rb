class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, :presence => true, :uniqueness => true, :case_sensitive => false
  validates :email, :presence => true, :uniqueness => true
  validates :encrypted_password, :presence => true
  has_many :comments
  has_many :posts
end
