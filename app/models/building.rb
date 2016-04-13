class Building < ActiveRecord::Base
  has_many :pictures, as: :imageable
  has_many :reviews
  has_many :rooms
  belongs_to :quad
end
