class RegistrationsController < Devise::RegistrationsController
  private
  def sign_up_params
    params.require(:user).permit(
        :first_name,
        :last_name,
        :phone_number,
        :address,
        :city,
        :zip_code,
        :email,
        :password,
        :password_confirmation
    )
  end
end