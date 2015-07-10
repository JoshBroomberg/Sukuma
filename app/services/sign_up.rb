def SignUp
	def processSignup client
        acc = initAcc
        greet(acc, client)
	end

	def initAcc 
		acc= current_client.build_account(balance: 0.0, account_id: accGen, pin: pinGen)
		acc.save
		acc
	end

	def greet(acc, client)
		require "MessengerService"
		ms = MessengerService.new()
		ms.sendMessage("welcome to SUKUMA. In a few simple steps you will be ready to transact via sms. \n\nFirstly, please complete your profile on our website. If you haven't already, sign in with number: #{client.number} and password: #{client.password} This is critical so that we can get to know you.\n\nSecondly, please take note of your AccountID which is #{acc.account_id}. You will use this ID to make purchases at stores. \n\nLastly,save the number +16123613027 to your phone. You can send 'y' or 'n' to this number to confirm actions or send 'b' to check your balance. We know you will love our product.\n\nThe SUKUMA team.", current_client)
	end

	def accGen
		accID = SecureRandom.base64(3).gsub(/=+$/,'a')
		while Account.where(account_id: accID).count >0
			accID = SecureRandom.base64(3).gsub(/=+$/,'a')
		end
		accID.downcase
	end

	def pinGen
		pin = ""
		(1..4).each do
			pin+=SecureRandom.random_number(9).to_s
		end
		pin
	end
end