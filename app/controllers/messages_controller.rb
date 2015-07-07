class MessagesController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	#apply DRY principle
	def create
		senderNumber = params["From"]
		user = Client.find_by(number: senderNumber)
		if user.profile.class.name == "Vprofile" 
			name = user.profile.businessname
		else
			name = user.profile.firstname
		end
		case params["To"]
		when "+12316468691" 
			kind = :purchaseInit

		when "+16123612985"
			kind = :depositInit 
		when "+16123613027"
			kind = :confirm	
		end
		ms = MessengerService.new()
		#sendernumber = "+27836538932" #params["From"]
		ms.saveMessage(kind, params["Body"].downcase, senderNumber, name)
		render :nothing => true, :status => 200, :content_type => 'text/html'
		
	end





end
