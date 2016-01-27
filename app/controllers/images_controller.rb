class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def new

  end

  def create
    @image = Image.create({image_url: params[:image_url], product_id: params[:product_id]})

    flash[:success] = "New Image Created"

    redirect_to "/images"
  end

  def show
    @image = Image.find(params[:id])
  end

  def edit
    @image = Image.find(params[:id])
    # @images = Product.find(:id).images
  end

  def update
    @image = Image.find(params[:id])

    @image.update({image_url: params[:image_url], product_id: params[:product_id]})

    flash[:info] = "Image Updated"

    render :edit
  end

  def destroy
    @image = Image.find(params[:id])

    @image.destroy

    flash[:danger] = "Image Deleted"

    redirect_to '/images'
  end

end
