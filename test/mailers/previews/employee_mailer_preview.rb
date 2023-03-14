# Preview all emails at http://localhost:3000/rails/mailers/employee_mailer
class EmployeeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/employee_mailer/application_status
  def application_status
    EmployeeMailer.application_status
  end

end
