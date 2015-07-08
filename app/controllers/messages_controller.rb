class MessagesController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	#apply DRY principle
	def create
		ms = MessengerService.new()
		senderNumber = params["From"]
		sender = Client.find_by(number: senderNumber)
		case params["To"]
		when "+12316468691" 
			kind = :purchaseInit

		when "+16123612985"
			kind = :depositInit 
		when "+16123613027"
			kind = :confirm	
		end
		ms.processMessage(kind, params["Body"].downcase, sender)
		render :nothing => true, :status => 200, :content_type => 'text/html'
		
	end





end
