class Applicants::BaseController < ApplicationController
  before_action :authenticate_applicant!

  layout "applicant"
end
