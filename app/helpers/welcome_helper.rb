module WelcomeHelper
	def profileChecker
		if client_signed_in?
			if current_client.profile==nil
				return true
			else
				return false
			end
		end
	end
end
