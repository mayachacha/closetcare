class MylistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dress, expect: [:show]

  def create
    mylist = current_user.mylists.build(dress_id: params[:dress_id])
    mylist.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    mylist = Mylist.find_by(dress_id: params[:dress_id], user_id: current_user.id)
    mylist.destroy
    respond_to do |format|
      format.js
    end
  end

  def show
    @mylists = Mylist.all 
    @dresses = Dress.includes(:mylists).order(created_at: :desc)
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
    @dress = Dress.find(params[:id])
  end
  
end


