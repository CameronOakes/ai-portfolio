class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new(user: current_user, library: Library.find(params[:library_id]))
    @library = Library.find(params[:library_id])
    if @bookmark.save
      redirect_to @library, notice: 'Library bookmarked'
      puts '__________ Library bookmarked ___________'
    else
      puts " ----------- #{@bookmark.errors} --------------"
    end
  end
end
