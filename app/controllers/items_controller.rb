class ItemsController < ApplicationController
  before_action :set_library

  def show
    @library = Library.find(params[:library_id])
  end

  private

  def set_library
    @library = Library.find(params[:library_id])
  end
end
