class Public::ReviewsController < ApplicationController
  def new
    @item_post = ItemPost.find(params[:item_post_id])
    @review = Review.new
  end

  def create
   
    @item_post = ItemPost.find(params[:item_post_id])
    @review = Review.new(review_params)
    @review.item_post_id  = @item_post.id
    @review.customer_id = current_customer.id
    if @review.save
      #追加したアイテムの詳細ページ
      redirect_to item_post_path(@item_post)
      #追加したアイテム名を表示
      flash[:notice] = "レビューを投稿しました。"
    else
      flash[:alert] = "レビューの投稿に失敗"
      @item_post = ItemPost.find(params[:item_post_id])
      @review = Review.new(review_params)
      render :new
    end
  end

  def index
  end

  def show
    @item_post = ItemPost.find(params[:item_post_id])
    @reviews = Review.find(params[:id])
  end

  def edit
  end

  private

  def review_params
   params.require(:review).permit(:customer_id, :item_post_id, :title, :impression, :item_price, :star)
  end
end