class User < ApplicationRecord
  # Virtual attribute for authenticating by either admin username or user email

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # for one-one relationship
  belongs_to :function, polymorphic: true

  # many-to-one relationship
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy


  # Allow Devise to authenticate with either admin username or user email
  attr_writer :login
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      admin = Admin.find_by(username: login)
      if admin && admin.user
        return admin.user
      else
        return where(conditions.to_h).where(["lower(email) = :value", { value: login.downcase }]).first
      end
    else
      where(conditions.to_h).first
    end
  end


  def login
    @login || self.function.try(:username) || self.email
  end
end
