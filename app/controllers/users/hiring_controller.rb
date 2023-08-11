class Users::HiringController < Users::BaseController
  def hiring_form
    @user = current_user
  end
end
