class Line < ActiveRecord::Base
  has_many :posts
  belongs_to :board 
end
