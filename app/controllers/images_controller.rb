class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def new

  end

  def create
    @image = Image.create({image_url: params[:image_url]})

    flash[:success] = "New Image Created"

    redirect_to "/images"
  end

  def show

  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])

    @image.update({image_url: params[:image_url]})

    flash[:info] = "Image Updated"

    render :edit
  end

  def destroy
    @image = Image.find(params[:id])

    @image.destroy

    flash[:danger] = "Image Deleted"

    redirect_to '/Images'
  end

end
