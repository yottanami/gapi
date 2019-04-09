class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :validatable

  after_create :update_access_token!

  def update_access_token!
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
    save!
  end

  validates_presence_of :mobile
  validates :mobile, length: { maximum: 11, minimum: 11 }, uniqueness: true


  def email_required?
    false
  end

  def email_changed?
    false
  end

  def password_required?
    false
  end

  def password_changed?
    false
  end

    validates :email, uniqueness: false, presence: false, allow_blank: true
end
