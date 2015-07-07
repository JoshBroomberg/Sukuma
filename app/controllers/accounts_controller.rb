class AccountsController < ApplicationController
	before_action :authenticate_client!
	def show
		@account = current_client.account
	end
end
