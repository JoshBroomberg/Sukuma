class MessagesController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	#apply DRY principle
	def create
		senderNumber = params["From"]
		user = Client.find_by(number: senderNumber)
		case params["To"]
		when "+12316468691" 
			kind = :purchaseInit 
			name = user.profile.businessname
		when "+16123612985"
			kind = :depositInit 
			name = user.profile.businessname
		when "+16123613027"
			kind = :confirm
			name = user.profile.firstname		
		end
		ms = MessengerService.new()
		#sendernumber = "+27836538932" #params["From"]
		ms.saveMessage(kind, params["Body"].downcase, senderNumber, name)
		render :nothing => true, :status => 200, :content_type => 'text/html'
		
	end





end
