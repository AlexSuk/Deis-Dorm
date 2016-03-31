class Line < ActiveRecord::Base
  has_many :posts
  belongs_to :board
  belongs_to :user
  has_many :pictures, as: :imageable
end
