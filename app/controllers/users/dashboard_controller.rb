class Users::DashboardController < Users::BaseController
  def index
    @employees = Employee.all
    # Employee::WORK_EXPERIENCE.map do |key|
    #   [ I18n.t(".employee.work_experience.#{key}"), key]
    # end
  end
end
