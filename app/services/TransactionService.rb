class TransactionService
    require "MessengerService"
	
	def processTransaction (customer, vendor, amount, kind)
		

		
		ms = MessengerService.new()
		vname = vendor.profile.name
		cname = customer.profile.name

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
				ms.sendMessage(body, customer)
				transaction.update(state: :waitingconfirm)
			else
				ms.sendMessage("Insufficient balance for requested action", customer)
				ms.sendMessage("Insufficient balance for requested action", vendor)
				transaction.update(state: :fail)
			end
		else
			ms.sendMessage("You already have a transaction pending, please confirm or reject that first", customer)
		end
	end

	def processConfirm sender, body, kind
	#user = Client.find_by(number: senderNumber)
		
		ms = MessengerService.new()
		name = sender.profile.name
		useraccount = sender.account
		transaction  = Transaction.find_by(customer_id: sender.id, state: 1)

		

		if body.length == 1
			if body.index("y") != nil || body.index("n") !=nil
				if Transaction.where(customer_id: sender.id, state: 1).count > 0
					vendor = Client.find(transaction.vendor_id)
					vendoraccount = vendor.account

					confirm = nil
					if body=="y"
						confirm = true
					elsif body=="n"
						confirm = false
					end
					message = sender.messages.build(kind: kind, confirm: confirm)
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
							if useraccount.update(balance: ubalance) && vendoraccount.update(balance: vbalance)
								transaction.update(state: :success)
								ms.sendMessage("You have confirmed the requested action, your current balance is R#{ubalance}", sender)
								#send confirm message to vendor here
								#sendMessage("You have confirmed the requested action, your current balance is #{balance}", senderNumber, name)
							end


						else
							transaction.update(state: :reject)
							ms.sendMessage("You have rejected the requested action", sender)
							#send reject message to vendor here
							#sendMessage("You have confirmed the requested action, your current balance is #{balance}", senderNumber, name)
						end
					end

				else
					ms.sendMessage("You have no transactions to confirm", sender)
				end
					
			else
				if body.index("b") != nil
					ms.sendMessage("Your balance is R#{sender.account.balance}", sender)
				else
					ms.sendMessage("Your message must be either 'y', 'n', or 'b'", sender)
				end
			end
				
		else
			ms.sendMessage("Your message must be 1 letter long", sender)
		end
		

	end
end