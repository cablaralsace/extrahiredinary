class EmployeeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.employee_mailer.application_status.subject
  #
  def application_status
    @employee = params[:employee]
    @greeting = "Hi"

    # mail to: "to@example.org"
    mail(
      from: "hello@extrahiredinary.com",
      to: Employee.last.email,
      subject: "ExtraHIREdinary: Application Status"
    )
  end
end
