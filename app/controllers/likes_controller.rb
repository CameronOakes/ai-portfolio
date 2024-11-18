class LikesController < ApplicationController
  before_action :set_user
  before_action :active_storage_attachment, only: %i[create destroy]

  def create
    @photo = ActiveStorage::Attachment.find(params[:id])
    @like = Like.new(user: current_user, active_storage_attachments_id: params[:id])
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

  def destroy
    @like = Like.find_by(user: current_user, active_storage_attachments_id: params[:id])
    if @like
      @like.destroy
      flash[:success] = 'Like removed successfully.'
      puts 'Like removed successfully.'
    else
      flash[:error] = 'Failed to remove like.'
      puts 'Failed to remove like.'
    end
    redirect_to request.referer || root_path
  end

  def index
    @user = current_user
    @liked_photos = @user.likes
  end

  def destroy_all
    @user.likes.destroy_all
    redirect_to request.referer || root_path
  end

  private

  def like_params
    params.require(:like).permit(:user, :active_storage_attachment)
  end

  def active_storage_attachment
    @active_storage_attachment = ActiveStorage::Attachment.find(params[:id])
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def set_like
    @like = Like.find(params[:id])
  end
end
