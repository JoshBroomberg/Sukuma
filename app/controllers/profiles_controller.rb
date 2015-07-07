class ProfilesController < ApplicationController

	def new
		@profile = Profile.new
		render "new"
	end

	def create
		@profile = current_client.build_profile(profile_params)
		if @profile.save
			redirect_to dashboard_path()
		else
			render "new"
		end


	end

	def edit
	end

	def update
	end

	def profile_params
		params.require(:profile).permit(:businessname, :category, :client, :type, :firstname,:lastname,:age)
	end
end
