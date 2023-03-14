class Users::DashboardController < Users::BaseController
  def index
    @employees = Employee.all
  end
end
