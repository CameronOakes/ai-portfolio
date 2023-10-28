class LibrariesController < ApplicationController
  def new
    @library_new = Library.new
    @user = User.find(current_user.id)
  end

  def create
    @library_new = Library.new(library_params)

    if @library_new.save
      redirect_to @library_new, notice: 'Library created'
    else
      render :new
    end
  end

  def index
    @libraries = Library.all
  end

  def show
    @library = Library.find(params[:query])
  end

  private

  def library_params
    params.require(:library).permit(:name, :description, :photos)
  end
end
