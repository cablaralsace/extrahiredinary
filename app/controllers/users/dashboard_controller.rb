class Users::DashboardController < Users::BaseController
  def hired_employees
    @employees = Employee.all.where(type: "Employee").order('created_at ASC')
  end

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end
end
