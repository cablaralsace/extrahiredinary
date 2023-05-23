class Users::DashboardController < Users::BaseController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
    @pdf_url = url_for(@employee.file.pdf)
  end
end
