class LibrariesController < ApplicationController
  before_action :set_user
  before_action :set_library, only: [:update_report]

  def new
    @library_new = Library.new
    @user = User.find(current_user.id)
  end

  def create
    @library_new = Library.new(library_params)
    @library_new.user = @user

    if @library_new.save
      redirect_to @library_new, notice: 'Library created'
    else
      puts " -----------
      #{@library_new.errors}
      --------------
      "
      render :new
    end
  end

  def user_libraries
    @user_libraries = Library.where(user_id: @user.id)
  end

  def index
    @libraries = Library.all
  end

  def show
    @library = Library.find(params[:id])
  end

  def destroy
    @library = Library.find(params[:id])
    if @library.user == current_user
      @library.destroy
      redirect_to user_libraries_path, notice: 'Library succesfully deleted.'
    else
      redirect_to user_libraries_path, alert: 'You do not have permission to cancel this booking.'
    end
  end

  def update_report
    # Assume the value you want to update is passed as a parameter
    @library.update_attribute(:report, params[:value])

    render json: { status: 'success' }
  end

  private

  def library_params
    params.require(:library).permit(:name, :description, photos: [])
  end

  def set_library
    @library = Library.find(params[:id])
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
