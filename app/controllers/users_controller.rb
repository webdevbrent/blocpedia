class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def downgrade_account
    current_user.standard!
    flash[:notice] = "Your account has been downgraded."
    redirect_to edit_user_registration_path
  end
end
