class ProfilesController < ApplicationController
  def user_show
    @user = current_user
    @libraries = @user.libraries
  end

  def show
    @user = User.find(params[:id])
    @libraries = @user.libraries
  end
end
