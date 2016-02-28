class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true
  has_many :reviews
  has_many :posts
end
