class EmployeeMailerJob < ApplicationJob
  queue_as :default

  def perform(employee_params)
    puts "*" * 80
    puts employee_params
  end
end
