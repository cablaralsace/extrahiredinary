class Users::EmployeesController < Users::BaseController
  def show
    @employee = Employee.find(params[:id])
  end

  def update_status
    # Find employee instance by employee_id
    @employee = Employee.find(params[:employee_id])

    # Update employee instance status and save
    @employment_event = @employee.employment_events.create!(
      user: current_user,
      status: params[:status]
    )

    # Redirect to show employee with notice
    redirect_to employee_path(@employee), notice: "Status updated to #{@employment_event.status_translation}."
  end

  private

  def employee_params
    params.require(:employee_params).permit(:status)
  end
end
