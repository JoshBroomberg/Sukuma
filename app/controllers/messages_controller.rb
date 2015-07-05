class MessagesController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	def create
        closed = false
		if params["To"] == "+12316468691"
			vendor = Vendor.where(number: "+12316468691")[0] #chnage to have number from 
			category = "PI" #purchase init
			message = vendor.messages.build(body: params["Body"], category: category, closed: closed)
			if message.save
			reply("This is a Pi reply", "+27836538932", "Josh")
			end
		elsif params["To"] == "+16123612985"
			vendor = Vendor.where(number: "+12316468691")[0] #chnage to have number from
			category = "DI" #deposit init
			message = vendor.messages.build(body: params["Body"], category: category, closed: closed)
			if message.save
			reply("This is a Di reply", "+27836538932", "Josh")
			end
		elsif params["To"] == "+16123613027"
			user = User.where(number: "+12316468691")[0]
			category = "Conf" #confirm
			message = user.messages.build(body: params["Body"], category: category, closed: closed)
			if message.save
			reply("This is a conf reply", "+27836538932", "Josh")
			end
		end
        #message = Message.new(body: params["Body"])
		#message.save
		
	end





	def reply(body, number, name)
		account_sid = "ACabc2a633d8052c4b8805de4b678f4166"
		auth_token = "255b0b0cd465bbd6d0e3b3a32cd1ad4e"
		client = Twilio::REST::Client.new account_sid, auth_token

		from = "+12316468691"

		friends = {
			number => name
		}
		friends.each do |key, value|
			client.account.messages.create(
				:from => from,
				:to => key,
				:body => "Hi #{name}... "+body
				)
			
		end
	end



end
