class AccountsController < ApplicationController
	def show
		@account = current_client.account
	end
end
