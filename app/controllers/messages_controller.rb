class MessagesController < ApplicationController
    skip_before_filter  :verify_authenticity_token
	def createsale
		message = Message.new(body: params["Body"])
		message.save
	end

end
