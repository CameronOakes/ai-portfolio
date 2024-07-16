class LikesController < ApplicationController
  def create
    @photo = ActiveStorage::Attachment.find(params[:id])
    @like = Like.new(user: current_user, active_storage_attachments: @photo)
    puts "'#{current_user}' liked '#{@photo}'."
    if @like.save
      flash[:success] = 'Like created successfully.'
      puts 'Like created successfully.'
      redirect_to root_path
    else
      flash[:error] = 'Failed to create like.'
      puts 'Failed to create like.'
      redirect_to root_path
    end
  end
end
