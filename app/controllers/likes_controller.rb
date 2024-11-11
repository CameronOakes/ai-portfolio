class LikesController < ApplicationController
  def create
    @photo = ActiveStorage::Attachment.find(params[:id])
    @like = Like.new(user: current_user, active_storage_attachments: @photo)
    puts "'#{current_user}' liked '#{@photo}'."
    if @like.save
      flash[:success] = 'Like created successfully.'
      puts 'Like created successfully.'
    else
      flash[:error] = 'Failed to create like.'
      puts 'Failed to create like.'
      redirect_to new_user_registration_path
    end
    redirect_to request.referer || root_path
  end

  def index
    @user = current_user
    @liked_photos = @user.likes
  end
end
