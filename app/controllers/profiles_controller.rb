class ProfilesController < ApplicationController

	def new
		if current_client.profile == nil
		@profile = Profile.new
		render "new"
		else
			redirect_to account_path
		end
	end

	def create
		paramsToSave = profile_params
		paramsToSave[:category] = paramsToSave[:category].to_i
		@profile = current_client.build_profile(paramsToSave)
		if @profile.save
			redirect_to account_path
		else
			render "new"
		end


	end

	def edit
	end

	def update
	end

	def profile_params
		if params[:profile]!=nil
			params.require(:profile).permit(:businessname, :category, :client, :type, :firstname,:lastname,:age)
		elsif params[:vprofile]
			params.require(:vprofile).permit(:businessname, :category, :client, :type, :firstname,:lastname,:age)
		elsif params[:cprofile]
			params.require(:cprofile).permit(:businessname, :category, :client, :type, :firstname,:lastname,:age)
		end
	end
end
