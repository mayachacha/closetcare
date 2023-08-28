class DressesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_dress, only: [:show, :edit]


  def index
    @dresses = Dress.includes(:user).order(created_at: :desc)
    @genres = Genre.all

    @genre_images = {
      "TOPS" => "tops.png",
      "BOTTOMS" => "bottoms.png",
      "DRESS" => "dress.png",
      "SHOES" => "shoes.png",
      "OUTERS" => "outers.png",
      "BAGS" => "bags.png",
      "ACCESSORIES" => "accessories.png",
      "PAFUMES" => "pafumes.png",
      "UNDERWEARS" => "underwares.png",
      "OTHERS" => "others.png",
    }
  end

  def new
    @dress = Dress.new
    @genres = Genre.new
    @maingenres= Genre.where(ancestry: nil)
  end

  def search
    item = Genre.find(params[:id])
    children_item = item.children
    
    render json:{ item: children_item }
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
  end

  def destroy
    dress = Dress.find(params[:id])
    dress.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    dress = Dress.find(params[:id])
    if @dress.update(dress_params)
      redirect_to dress_path(dress.id)
    else
      render :edit
    end
  end

  private
    def dress_params
      params.require(:dress).permit(:genre_id, :size_id, :brand, :date, :price, images: []).merge(user_id: current_user.id)
    end

    def set_dress
      @dress = Dress.find(params[:id])
    end
    
end
