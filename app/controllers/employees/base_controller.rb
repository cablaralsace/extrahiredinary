class Employees::BaseController < ApplicationController
  before_action :authenticate_employee!

  layout "employee"
end
