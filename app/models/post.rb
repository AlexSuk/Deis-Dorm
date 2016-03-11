class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :line
  has_many :pictures
end
