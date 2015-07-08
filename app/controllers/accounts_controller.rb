class AccountsController < ApplicationController
	before_action :authenticate_client!
	def show
		@account = current_client.account
		@transactions = Transaction.where(customer_id: current_client.id)
	end

	def edit
		@account = current_client.account
		@profile = current_client.profile
		render "editforms"
	end

	def update
		if current_client.account.update(pin_param)
			redirect_to account_path
		else
			@profile = current_client.profile
			render "editforms"
		end
	end



	def pin_param
		params.require(:account).permit(:pin)
	end
end
