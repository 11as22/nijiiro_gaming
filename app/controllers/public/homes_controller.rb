class Public::HomesController < ApplicationController
  def top
    @item_post_count = ItemPost.includes(:item_name).count
    @review_count = Review.includes(:review).count
  end
  
  def index
    @genres = ItemGenre.all
    @genre = ItemGenre.find(params[:id])
    # 同じジャンルIDを持つ全てのアイテムを手に入れる
    item_posts = @genre.item_posts.where(params[:id])
    @item_posts =  Kaminari.paginate_array(item_posts).page(params[:page])
    @item_posts_count = @genre.item_posts.where(params[:id]).count
  end
    

  def about
  end
end
