class MessengerService

	def saveMessage(kind, body, senderNumber, name)
		user = Client.find_by(number: senderNumber)
		puts "id"+user.id.to_s

		closed = false
		if kind != :confirm
			if body.index(" ") != nil
				parts = body.split(" ")
				if parts[0].length==4
					parts[0] = parts[0].downcase
					parts[1] = parts[1].gsub(",", ".")
					if isNumeric parts[1] #validate >0
						message = user.messages.build(account_id: parts[0], amount: parts[1], kind: kind)
						if message.save
							clientAcc = Account.find_by(account_id: parts[0])
							client = clientAcc.client
							if client.profile.class.name == "Vprofile" 
								clientname = client.profile.businessname
							else
								clientname = client.profile.firstname
							end
							#clientname = client.profile.firstname
							#number = "+27836538932" #client.number #should go where 083 is
							
							
							#create a transaction
							ts = TransactionService.new() 
							ts.processTransaction(client, user, message.amount, kind)

						end
					else
						sendMessage("Please ensure the amount you entered is a digit and is greater than 0", senderNumber, name)
					end



				else
					sendMessage("AccID must be 4 characters", senderNumber, name)
				end
			else
				sendMessage("Please separate AccID and amount with a space", senderNumber, name)
			end

		else
			ts = TransactionService.new() 
			ts.processConfirm(senderNumber, body)
		end
	end

	def isNumeric number
		Float(number) != nil rescue false
	end

	def sendMessage(body, number, name)
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