class TransactionService
    require "MessengerService"
	
	def processTransaction (customer, vendor, amount, kind)
		

		
		ms = MessengerService.new()
		if vendor.profile.class.name == "Vprofile" 
			vname = vendor.profile.businessname
		else
			vname = vendor.profile.firstname
		end
		if customer.profile.class.name == "Vprofile" 
			cname = customer.profile.businessname
		else
			cname = customer.profile.firstname
		end

		body = "error..."
		if kind == :purchaseInit
			body = "You are about to pay #{vname} R#{amount}. Please sendMessage with y/n to confirm number (+16123613027)"
			kind = :purchase
		elsif kind == :depositInit
			body = "You are making a deposit with #{vname}, value R#{amount}. Please sendMessage with y/n to confirm number (+16123613027)"
			kind = :deposit
		end

		if Transaction.where(customer_id: customer.id, state: 1).count == 0 && Transaction.where(customer_id: customer.id, state: 0).count == 0

			transaction = Transaction.new(customer_id: customer.id, vendor_id: vendor.id, amount: amount, state: :initiated, kind: kind)
			transaction.save

			balanceSuff= true
			if kind == 0 && customer.account.balance<amount 
				balanceSuff = false
			end

			if balanceSuff
				ms.sendMessage(body, customer.number, cname)
				transaction.update(state: :waitingconfirm)
			else
				ms.sendMessage("Insufficient balance for requested action", customer.number, cname)
				ms.sendMessage("Insufficient balance for requested action", vendor.number, vname)
				transaction.update(state: :fail)
			end
		else
			ms.sendMessage("You already have a transaction pending, please confirm or reject that first", customer.number, cname)
		end
	end

	def processConfirm senderNumber, body, kind
		user = Client.find_by(number: senderNumber)
		if user.profile.class.name == "Vprofile" 
			name = user.profile.businessname
		else
			name = user.profile.firstname
		end
		ms = MessengerService.new()
		
			useraccount = user.account
			transaction  = Transaction.find_by(customer_id: user.id, state: 1)
			if Transaction.where(customer_id: user.id, state: 1).count > 0
				vendor = Client.find(transaction.vendor_id)
				vendoraccount = vendor.account
				
				if body.length == 1
					if body.index("y") != nil || body.index("n") !=nil

						confirm = nil
						if body=="y"
							confirm = true
						else
							confirm = false
						end
						message = user.messages.build(kind: kind, confirm: confirm)
						if message.save
							if confirm
								
								#update account
								ubalance = useraccount.balance
								
								vbalance = vendoraccount.balance
								if transaction.kind == "purchase"
									
									ubalance = ubalance-transaction.amount
									
									vbalance = vbalance+transaction.amount
									
								elsif transaction.kind == "deposit"
									
									ubalance = ubalance+transaction.amount
									
									vbalance = vbalance-transaction.amount
								end
								
								#useraccount.balance = ubalance
								
								if useraccount.update(balance: ubalance) && vendoraccount.update(balance: vbalance)
									transaction.update(state: :success)
									ms.sendMessage("You have confirmed the requested action, your current balance is R#{ubalance}", senderNumber, name)
									#send confirm message to vendor here
									#sendMessage("You have confirmed the requested action, your current balance is #{balance}", senderNumber, name)
								end
								

							else
								transaction.update(state: :reject)
								ms.sendMessage("You have rejected the requested action", senderNumber, name)
								#send reject message to vendor here
								#sendMessage("You have confirmed the requested action, your current balance is #{balance}", senderNumber, name)
							end
						end

					else
						ms.sendMessage("Your message must be either 'y' or 'n'", senderNumber, name)
					end
				else
					ms.sendMessage("Your message must be 1 letter long", senderNumber, name)
				end
			else
				ms.sendMessage("You have no transactions to confirm", senderNumber, name)
			end
	end
end