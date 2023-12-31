class GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id]) # 特定のジャンルをデータベースから取得
    @dresses = @genre.dresses.includes(:user).order('created_at DESC') # 特定のジャンルに属するドレスをデータベースから取得し、新しいものから順に並べ替え
    @mylist = current_user.mylists
  end
  end
