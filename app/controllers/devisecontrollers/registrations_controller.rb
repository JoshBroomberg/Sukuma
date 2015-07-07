class Devisecontrollers::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  protected
  def after_sign_up_path_for(resource)
    initAcc
    new_profile_path # Or :prefix_to_your_route
  end

  def initAcc 
      acc= current_client.build_account(balance: 0.0, account_id: accGen, pin: pinGen)
      acc.save
  end

  def accGen
    accID = SecureRandom.base64(3).gsub(/=+$/,'a')
    while Account.where(account_id: accID).count >0
      accID = SecureRandom.base64(3).gsub(/=+$/,'a')
    end
     accID.downcase
  end

  def pinGen
    pin = ""
    (1..4).each do
      pin+=SecureRandom.random_number(9).to_s
    end
    pin
  end

  




  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
