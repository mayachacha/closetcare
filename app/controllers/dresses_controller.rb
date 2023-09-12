class DressesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :show, :edit]
  before_action :set_dress, only: [:show, :edit, :update]


  def index
    @dresses = Dress.includes(:user).order(created_at: :desc).page(params[:page]).per(30)
    @mylist = current_user.mylists
    @genres = Genre.all 
    @genre_images = {
      2 => "tops-img.png",
      3 => "bottoms-img.png",
      4 => "dresses-img.png",
      5 => "shoes-img.png",
      6 => "outers-img.png",
      7 => "bags-img.png",
      8 => "accessories-img.png",
      9 => "pafumes-img.png",
      10 => "underwears-img.png",
      11 => "others-img.png",
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
        puts @dress.errors.full_messages
      render :new, status: :unprocessable_entity
    end

  end

  def show
  end

  def destroy
    dress = Dress.find(params[:id])
    dress.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    if @dress.update(dress_params)
      redirect_to dress_path(@dress.id)
    else
      render :edit
    end
  end

  private
    def dress_params
      params.require(:dress).permit(:genre_id, :size_id, :brand, :date, :price, :memo, images: []).merge(user_id: current_user.id)
    end

    def set_dress
      @dress = Dress.find(params[:id])
    end
    
end
