class UsersController < ApplicationController
  before_action :authenticate_user!


  def downgrade_account
    user = current_user
    user.standard!
    user.wikis.update(private: false)
    flash[:notice] = "Your account has been downgraded."
    redirect_to edit_user_registration_path
  end


end
