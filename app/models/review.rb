class Review < ActiveRecord::Base
  has_many :pictures, as: :imageable
  belongs_to :user
  belongs_to :building

  acts_as_taggable_on :tags
end
