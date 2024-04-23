class ProfilesController < ApplicationController
  def show
    @user = current_user
    @libraries = @user.libraries
  end
end
