class MessagesController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	#apply DRY principle
	def create
		closed = false
		if params["To"] == "+12316468691"
			vendor = Vendor.where(number: "+12316468691")[0] #chnage to have number from 
			category = "PI" #purchase init
			saveMessage(vendor, category, params["Body"])
		elsif params["To"] == "+16123612985"
			vendor = Vendor.where(number: "+12316468691")[0] #chnage to have number from
			category = "DI" #deposit init
			saveMessage(vendor, category, params["Body"])
		elsif params["To"] == "+16123613027"
			user = User.where(number: "+12316468691")[0]
			category = "Conf" #confirm
			saveMessage(user, category, params["Body"], params["From"])
		end
		
	end

	def saveMessage(obj, category, body, senderNumber)
		if body.index(" ") != nil
			parts = body.split(" ")
			if parts[0].length==4
				parts[1] = parts[1].gsub(",", ".")
				if isNumeric parts[1]
					message = obj.messages.build(account_id: parts[0], amount: parts[1], category: category, closed: closed)
					if message.save
						#number must be desired customer number based on acc_id
						reply("This is a #{category} reply", "+27836538932", "Josh")
					end
				else
					reply("Please ensure the amount you entered is a digit", senderNumber, "Josh")
				end



			else
				reply("AccID must be 4 characters", senderNumber, "Josh")
			end
		else
			reply("Please separate AccID and amount with a space", senderNumber, "Josh")
		end
	end

	def isNumeric number
		Float(number) != nil rescue false
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
