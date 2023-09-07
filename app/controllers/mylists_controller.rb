class MylistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dress, only: [:create, :destroy]

  def index
    # 現在のユーザーのマイリストのdressのidを取得
    mylists = Mylist.where(user_id: current_user).pluck(:dress_id) 
    @mylists = Mylist.where(dress_id: mylists).order(created_at: :desc).page(params[:page]).per(30)
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

  def create
    mylist = current_user.mylists.build(dress_id: params[:dress_id])
    mylist.save
    render partial: 'mylists/mylist', locals: { dress: @dress }
  end

  def destroy
    mylist = Mylist.find_by(dress_id: params[:dress_id], user_id: current_user.id)
    mylist.destroy
    render partial: 'mylists/mylist', locals: { dress: @dress }
  end

  def show
    @mylists = current_user.mylists
    @dresses = @mylists.map(&:dress)
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

  private
  def set_dress
    @dress = Dress.find(params[:dress_id])
  end
  
end


