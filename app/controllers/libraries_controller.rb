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

  def user_libraries
    @user_libraries = Library.where(user_id: @user.id)
  end

  def index
    @libraries = Library.all
  end

  # TODO: fix the ai_check boolean (WHY NO WORK??)

  def show
    @library = Library.find(params[:id])
    @library.photos.each do |photo|
      puts "------- This is the #{photo.report.class} report from the #{photo.name}: #{photo.report} -------"
    end
  end

  def run_scan
    @library = Library.find(params[:id])
    @library.photos.each do |photo|
      if photo.ai_check != false || photo.ai_check != true
        api_key = ENV['AI_OR_NOT']
        # api_key = ''
        payload = { object: "https://res.cloudinary.com/dll73yhjm/image/upload/c_fill,h_300,w_400/#{photo.key}" }

        # Set the headers
        headers = {
          'Authorization' => "Bearer #{api_key}",
          'Content-Type' => 'application/json'
        }

        # Set the URL
        url = 'https://api.aiornot.com/v1/reports/image'

        # Make the Faraday POST request
        response = Faraday.post(url) do |req|
          req.headers = headers
          req.body = payload.to_json
        end

        # Parse and print the response
        if response.success?
          @result = JSON.parse(response.body)
          photo.report = @result
          if @result['report']['verdict'] == 'human'
            photo.ai_check = false
          elsif @result['report']['verdict'] == 'ai'
            photo.ai_check = true
          else
            puts 'There was an error reading the API Json response'
          end
          puts "Success! Response: #{@result}"
        else
          puts "Error! Status code: #{response.status}, Body: #{response.body}"
        end
        photo.save
      end
    end
    redirect_to library_path(@library)
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
