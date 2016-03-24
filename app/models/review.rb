class Review < ActiveRecord::Base
  has_many :pictures, as: :imageable
  belongs_to :user
  belongs_to :building
end
