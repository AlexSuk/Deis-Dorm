class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true, confirmation: true
  has_many :reviews
  has_many :posts
end
