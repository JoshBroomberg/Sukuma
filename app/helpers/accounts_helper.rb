module AccountsHelper

	def spendData

		percentagehash = {}
		transactions = Transaction.where(:created_at => 1.months.ago..Time.now, customer_id: current_client.id, state: 3, kind: 0)
		sum = 0.0
		p2psum = 0.0
		prefixSum = {}
		counter = 1
		transactions.each do |transaction|
			if Client.find(transaction.vendor_id).profile.class.name == "Cprofile"
				p2psum += transaction.amount
			end
			 sum+=transaction.amount
			if prefixSum.length>0
				prefixSum[counter] = (prefixSum[counter-1]+transaction.amount)
			else
				prefixSum[counter]=(transaction.amount)
			end
			counter+=1
		end
		Profile.categories.each do |key, value|
			# catTrans = []
			# transactions.each do |trans|
				
			# 	if Client.find(trans.vendor_id).profile.category == key	
			# 		catTrans<<trans			
			# 	end
			# end
			catTrans = transactions.select{|transaction| Client.find(transaction.vendor_id).profile.category == key	}
			catTrans = catTrans.reject{|trans| Client.find(trans.vendor_id).profile.class.name == "Cprofile"	 }
			subSum = 0.0
			catTrans.each do |trans|
				subSum+= trans.amount
			end
		    percentagehash[key] = subSum
		    
		end
		

		percentagehash.each do |key,value|
			percentagehash[key] = (value/(sum-p2psum)*100).round(2)
		end
		percentagehash["Transfers"] = p2psum/(sum)*100.round(2)
		[percentagehash, prefixSum, transactions]

	end


end
