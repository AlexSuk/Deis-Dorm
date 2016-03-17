class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true
  has_secure_password
  has_many :reviews
  has_many :posts
  has_many :lines

  after_destroy :ensure_an_admin_remains
  private
    def ensure_an_admin_remains
      if User.count.zero? || User.where(admin?: true).count.zero?
        raise "Can't delete last user"
      end
    end

end
