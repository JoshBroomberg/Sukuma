class Vprofile < Profile
	validates :category, presence: true
	def name
		businessname
  	end
end
