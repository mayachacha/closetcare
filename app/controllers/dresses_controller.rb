class DressesController < ApplicationController
  def index
  end
  
  def new
    @dress = Dress.new
  end

  def create
    @dress = Dress.new(clothes_params)

    if @dress.save && @dress.image.attached?
    redirect to_ to root_path
    else      render :new, status: :unprocessable_entity
    end
  end

  private
    def dress_params
      dress.require(:dress, :image).permit(:genre_id, size_id, :brand, :date, :price)..merge(user_id: current_user.id)
    end
    
end
