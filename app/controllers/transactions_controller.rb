class TransactionsController < ApplicationController
	def index
		@transactions = Transaction.where(customer_id: current_client.id)
	end
end
