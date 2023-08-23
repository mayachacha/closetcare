class DressesController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @dresses = Dress.includes(:user).order(created_at: :desc)
  end

  def new
    @dress = Dress.new
  end

  def create
    @dress = Dress.new(dress_params)
    if @dress.save && @dress.images.attached?
     redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @dress = Dress.find(params[:id])
  end  

  private
    def dress_params
      params.require(:dress).permit(:genre_id, :size_id, :brand, :date, :price, images: []).merge(user_id: current_user.id)
    end
    
end
