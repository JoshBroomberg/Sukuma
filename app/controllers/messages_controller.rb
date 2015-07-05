class MessagesController < ApplicationController

	def createsale
		message = Message.new(body: params["body"])
	end

end
