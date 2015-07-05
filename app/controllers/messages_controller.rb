class MessagesController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	def createsale
		message = Message.new(body: params["Body"])
		message.save
		require 'rubygems'
		require 'twilio-ruby'

		account_sid = "ACabc2a633d8052c4b8805de4b678f4166"
		auth_token = "255b0b0cd465bbd6d0e3b3a32cd1ad4e"
		client = Twilio::REST::Client.new account_sid, auth_token

		from = "+12316468691" # Your Twilio number

		friends = {
			"+27836538932" => "Praise"
		}
		friends.each do |key, value|
			client.account.messages.create(
				:from => from,
				:to => key,
				:body => "Hey #{value}, how you doing"
				)
			puts "Sent message to #{value}"
		end
	end



end
