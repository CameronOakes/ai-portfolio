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

  def index
    @bookmarks = current_user.bookmarks.all
  end

  def destroy
    @bookmark = Bookmark.find_by(user: current_user, library: Library.find(params[:library_id]))
    @library = Library.find(params[:library_id])
    if @bookmark.user == current_user
      @bookmark.destroy
      redirect_to library_path(@library), notice: 'Bookmark removed'
      puts '__________ Bookmark removed ___________'
    else
      puts '__________ Bookmark not removed ___________'
    end
  end
end
