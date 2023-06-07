class Public::HomesController < ApplicationController
  def top
    @item_posts = ItemPost.all
    @genres = ItemGenre.all
  end
  
  def index
     # urlにgenre_idがある場合
    if params[:id]
    @genres = ItemGenre.all
    @genre = ItemGenre.find(params[:id])
    # 同じジャンルIDを持つ全てのアイテムを手に入れる
    @item_posts = @genre.item_posts.where(params[:id])
    else
    @item_posts = ItemPost.all
    @genres = ItemGenre.all
    render :top
    end
  end
    

  def about
  end
end
