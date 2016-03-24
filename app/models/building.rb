class Building < ActiveRecord::Base
  has_many :pictures, as: :imageable
  has_many :reviews
  belongs_to :quad
end
