class Review < ActiveRecord::Base
  has_many :pictures
  belongs_to :user
  belongs_to :building
end
