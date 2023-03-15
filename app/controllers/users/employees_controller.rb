class Users::EmployeesController < Users::BaseController
  def show
    @employee = Employee.find(params[:id])
  end
end
