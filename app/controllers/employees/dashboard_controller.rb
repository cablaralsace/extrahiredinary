class Employees::DashboardController < Employees::BaseController
  def index
    @employee = current_employee
  end
end
