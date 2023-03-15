class EmploymentEventController < ApplicationController
  def update_status
  end

  private

  def employment_event_params
    params.require(:employment_event).permit(:user_id, :employee_id)
  end
end
