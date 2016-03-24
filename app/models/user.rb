class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true
  has_secure_password
  has_many :reviews
  has_many :posts
  has_many :lines

  has_attached_file :icon, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  validates_attachment_content_type :icon, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_with AttachmentSizeValidator, attributes: :icon, less_than: 1.megabytes


  after_destroy :ensure_an_admin_remains
  private
    def ensure_an_admin_remains
      if User.count.zero? || User.where(admin?: true).count.zero?
        raise "Can't delete last user"
      end
    end

end
