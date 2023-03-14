class Employees::BaseController < ApplicationController
  before_action :authenticate_employee!

  layout "employee"

  private

  def employee_params
    devise_parameter_sanitizer.permit(:sign_up,
      keys: [
        :email,
        :first_name,
        :middle_name,
        :last_name,
        :date_of_birth,
        :contact_number,
        :work_experience,
        :education,
        :role,
        :character_references,
        :type,
        :file
      ])
  end
end
