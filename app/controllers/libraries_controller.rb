class LibrariesController < ApplicationController
  before_action :set_user

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

  def index
    @libraries = Library.all
  end

  def show
    @library = Library.find(params[:id])
  end

  private

  def library_params
    params.require(:library).permit(:name, :description, photos: [])
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
