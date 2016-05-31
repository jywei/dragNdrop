class MediaContentsController < ApplicationController

  def index
    @media_contents = Medium.all
  end

  def create
    @media = Medium.new(file_name: params[:file])
    if @media.save!
      render json: @media
    else
      puts 'Hello'
      render json: { error: 'Failed to process' }, status: 422
    end
  end

  def delete_media
    Medium.where(id: params[:media_contents]).destroy_all
    redirect_to root_url
  end

  def delete_all
    Medium.delete_all
    redirect_to root_url
  end

end
