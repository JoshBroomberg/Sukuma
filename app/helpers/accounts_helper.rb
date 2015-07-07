module AccountsHelper

	def spendPercentage

		percentagehash = {}
		transactions = Transaction.where(:created_at => 1.months.ago..Time.now, customer_id: current_client.id, state: 3, kind: 0)
		sum = 0.0
		transactions.each do |transaction|
			sum+=transaction.amount
		end
		Profile.categories.each do |key, value|
			catTrans = []
			transactions.each do |trans|
				
				if Client.find(trans.vendor_id).profile.category == key	
					catTrans<<trans			
				end
			end

			subSum = 0.0
			catTrans.each do |trans|
				subSum+= trans.amount
			end
		    percentagehash[key] = subSum
		    
		end

		percentagehash.each do |key,value|
			percentagehash[key] = (value/sum*100).round(2)
		end
		percentagehash
	end


end
