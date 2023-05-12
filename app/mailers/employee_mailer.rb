class EmployeeMailer < ApplicationMailer
  default from: "hello@extrahiredinary.com"

  def welcome_employee_email
    puts "*" * 80
    puts params
    @employee = params[:employee]
    mail(to: @employee[:email], subject: "Employee Registration")
    # mail(to: "admin@extrahiredinary.com", subject: "New Employee")
  end
end
