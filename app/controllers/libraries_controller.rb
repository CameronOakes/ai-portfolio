class LibrariesController < ApplicationController
  def new
    @library_new = Library.new
  end

  def create
    @library_new = Library.new
  end

  def index
    @libraries = Library.all
  end
end
