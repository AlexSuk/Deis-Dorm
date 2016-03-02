class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true, confirmation: true
  has_many :reviews
  has_many :posts

  after_destroy :ensure_an_admin_remains
  private
    def ensure_an_admin_remains
      if User.count.zero? || User.find_by_user_name("admin").nil?
        raise "Can't delete last user"
      end
    end

end
