class DressesController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @dresses = Dress.includes(:user).order(created_at: :desc)
    @genres = Genre.all 
    @genre_images = {
      2 => "tops2.png",
      3 => "bottoms3.png",
      4 => "dress4.png",
      5 => "shoes5.png",
      6 => "outers6.png",
      7 => "bags7.png",
      8 => "accessories8.png",
      9 => "pafumes9.png",
      10 => "underwares10.png",
      11 => "others11.png",
    }
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
