class Message < ActiveRecord::Base
  belongs_to :client

  enum kind: [:purchaseInit, :depositInit, :confirm]
  
end
