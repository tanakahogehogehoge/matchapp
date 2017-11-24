class Owners::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @owner = Owner.find_for_facebook_oauth(request.env["omniauth.auth"], current_owner)

    if @owner.persisted?
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
      sign_in_and_redirect @owner, event: :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_owner_registration_url
    end
  end
end
