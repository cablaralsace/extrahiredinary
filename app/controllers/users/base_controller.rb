class Users::BaseController < ApplicationController
  before_action :authenticate_user!

  layout "user"
end
