class Building < ActiveRecord::Base
  has_many :pictures
  has_many :reviews
  belongs_to :quad 
end
