class TransactionService
    ms = MessengerService.new()
    def processTranaction (customer, vendor, amount, kind, body)
	if Transaction.where(customer_id: customer.id, state: 1).count == 0 && Transaction.where(customer_id: customer.id, state: 0).count == 0

		transaction = Transaction.new(customer_id: customer.id, vendor_id: vendor.id, amount: amount, state: :initiated, kind: kind)
		transaction.save

		balanceSuff= true
		if kind == 0 && customer.account.balance<amount 
			balanceSuff = false
		end

		if balanceSuff
			ms.sendMessage(body, number, clientname)
			transaction.update(state: :waitingconfirm)
		else
			ms.sendMessage("Insufficient balance for requested action", customer.number, customer.profile.firstname)
			ms.sendMessage("Insufficient balance for requested action", vendor.number, vendor.profile.businessname)
			transaction.update(state: :fail)
		end
	else
		sendMessage("You already have a transaction pending, please confirm or reject that first", customer.number, customer.profile.firstname)
	end
end