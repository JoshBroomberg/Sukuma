class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  validates :number, length: { is: 12 }, uniqueness: true
  validates :email, uniqueness: false
  #validates :bio, length: { maximum: 500 }


  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
  	conditions = warden_conditions.dup
  	if login = conditions.delete(:login)
  		where(conditions.to_h).where(["lower(number) = :value", { :value => login.downcase }]).first
  	else
  		where(conditions.to_h).first
  	end
  end

  def email_required?
  	false
  end

  def email_changed?
  	false
  end

  has_one :account
  has_one :profile
  has_many :messages
  
  # 0 = customer
  # 1 = vendor
  enum kind: [:customer, :vendor]
end
