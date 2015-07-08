class Transaction < ActiveRecord::Base

	enum state: [:initiated, :waitingconfirm, :fail, :success, :reject]
	enum kind: [:purchase, :deposit]
	attr_accessor :accID
	
end
