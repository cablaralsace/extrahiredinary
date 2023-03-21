class Users::EmployeesController < Users::BaseController
  def show
    @employee = Employee.find(params[:id])
  end

  def update_status
    # Find employee instance by employee_id
    @employee = Employee.find(params[:id])

    # Update employee instance status and save
    @employee.update(status: params[:status])

    # Redirect to show employee with notice
    redirect_to @employee, notice: "Status updated to #{@employee.employment_events.last.status}"
  end

  private

  def employee_params
    params.require(:employee_params).permit(:status)
  end
end
