class RegistrationsController < Devise::RegistrationsController

  def after_sign_in_path_for(resource)
    redirect_to @test
  end

end