class GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id]) # 特定のジャンルをデータベースから取得
    @dresses = @genre.dresses.order('created_at DESC') # 特定のジャンルに属するドレスをデータベースから取得し、新しいものから順に並べ替え
    @dress = Dress.find(params[:id])
  end
  end
