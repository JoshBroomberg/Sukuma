class TransactionsController < ApplicationController
	before_action :authenticate_client!
	def index
		@transactions = Transaction.where(customer_id: current_client.id)
	end

	def new
		@transaction = Transaction.new
	end

	def create
		require "TransactionService"
		ts = TransactionService.new()
		vendorAcc = Account.find_by(account_id: trans_params[:accID])
		vendor = vendorAcc.client
		ts.processTransaction(current_client, vendor, trans_params[:amount], :purchaseInit)
		redirect_to account_path
	end

	def trans_params
		params.require(:transaction).permit(:amount, :accID)
	end
end
