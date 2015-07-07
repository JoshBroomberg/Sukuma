class TransactionsController < ApplicationController
	before_action :authenticate_client!
	def index
		@transactions = Transaction.where(customer_id: current_client.id)
	end

	def new
		@transaction = Transaction.new
	end
end
