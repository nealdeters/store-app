class SuppliersController < ApplicationController
  
  before_action :authenticate_admin!

  def index
    @suppliers = Supplier.all
  end

  def new

  end

  def create
    @supplier = Supplier.create({name: params[:name], email: params[:email], phone: params[:phone]})

    flash[:success] = "New Supplier Created"

    redirect_to "/suppliers"
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])

    @supplier.update({name: params[:name], email: params[:email], phone: params[:phone]})

    flash[:info] = "Supplier Updated"

    render :edit
  end

  def destroy
    @supplier = Supplier.find(params[:id])

    @supplier.destroy

    flash[:danger] = "Supplier Deleted"

    redirect_to '/suppliers'
  end
end
