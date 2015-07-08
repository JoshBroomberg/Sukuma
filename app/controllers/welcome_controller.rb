class WelcomeController < ApplicationController
	def index
		profileChecker
		
	end

	def profileChecker
		
		if client_signed_in?
			if current_client.profile==nil
				redirect_to new_profile_path
			else
				redirect_to account_path
			end
		else
			render layout: "home"

		end
	end
end
