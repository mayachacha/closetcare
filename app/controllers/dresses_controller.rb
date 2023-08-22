class DressesController < ApplicationController
  def index
  end

  def new
    @dress = Dress.new
  end

  def create
    @dress = Dress.new(dress_params)

    if @dress.save && @dress.image.attached?
    redirect_to root_path
    else      render :new, status: :unprocessable_entity
    end
  end

  private
    def dress_params
      params.require(:dress).permit(:genre_id, :size_id, :brand, :date, :price, images: []).merge(user_id: current_user.id)
    end
    
end
