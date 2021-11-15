class User < ActiveRecord::Base
  has_secure_password
  def name
    "#{first_name} #{last_name}"
  end
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true
  validates_uniqueness_of :email, case_sensitive: false
end