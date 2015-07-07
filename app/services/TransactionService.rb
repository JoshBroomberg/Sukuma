class TransactionService
	
	def processTranaction (customer, vendor, amount, kind)
		ms = MessengerService.new()
		if vendor.profile.class.name == "Vprofile" 
			vname = user.profile.businessname
		else
			vname = user.profile.firstname
		end
		if customer.profile.class.name == "Vprofile" 
			cname = user.profile.businessname
		else
			cname = user.profile.firstname
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
end