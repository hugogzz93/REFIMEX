class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication, only: [:new, :create], if: :administrator
  before_action :configure_permitted_parameters, if: :devise_controller?

  def create
    if user_signed_in? && current_user.admin?
      if User.create user_admin_params
        redirect_to users_path
      else
        render :new
      end
    else
      super
    end
  end

  protected

  def administrator
    user_signed_in? && current_user.admin?
  end

  def user_admin_params
    params.require(:user).permit(:name, :credentials, :email, :password, :password_confirmation)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
