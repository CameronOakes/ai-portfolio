class LibrariesController < ApplicationController
  def new
    @library_new = Library.new
    @user = User.find(current_user.id)
  end

  def create
    @library_new = Library.new

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
end
