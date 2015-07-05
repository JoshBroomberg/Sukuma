class MessagesController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	def create
        closed = false
		if params["To"] == "+12316468691"
			vendor = User.where(number: "+12316468691")[0] #chnage to vendor
			type = "PI" #purchase init
			message = vendor.messages.build(body: params["Body"], type: type, closed: closed)
			message.save
		elsif params["To"] == "+16123612985"
			vendor = User.where(number: "+12316468691")[0] #chnage to vendor
			type = "DI" #deposit init
			message = vendor.messages.build(body: params["Body"], type: type, closed: closed)
			message.save
		elsif params["To"] == "+16123612985"
			user = User.where(number: "+12316468691")[0]
			type = "Conf" #confirm
			message = user.messages.build(body: params["Body"], type: type, closed: closed)
			message.save
		end
        #message = Message.new(body: params["Body"])
		#message.save
		reply("This is a reply", "+27836538932", "Josh")
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
				:body => body
				)
			
		end
	end



end
