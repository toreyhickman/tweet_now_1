class User < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'
  include BCrypt

  validates :username, :presence => true
  validates :username, :uniqueness => true
  validates :password_hash, :presence => true

  # For use with carrierwave (e.g., profile pic, avatar, etc.)
  # mount_uploader :file, UserUploader

  # Bcrypt password hashing
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end