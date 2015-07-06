class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :account
  has_one :profile
  
  # 0 = customer
  # 1 = vendor
  enum kind: [:customer, :vendor]
end
