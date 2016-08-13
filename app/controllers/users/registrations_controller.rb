class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, only: [:cancel ]

  protected

    def after_sign_up_path_for(resource)
      root_path(resource)
    end

    def after_update_path_for(resource)
      account_path(resource)
    end

  private

    def sign_up_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end