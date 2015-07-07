module ProfilesHelper

	def vendor? profile
		if profile.class.name == "Vprofile"
			return true
		else
			return false
		end
	end

end
