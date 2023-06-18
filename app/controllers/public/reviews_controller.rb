class Public::ReviewsController < ApplicationController
  # ログインしていないユーザーの許されるアクション
  before_action :authenticate_customer!, except: [:index, :show]
  #他のカスマター自分に対して行えないアクション
  before_action :correct_customer, only: [:edit, :update, :destroy]
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
    @review = Review.find(params[:id])
  end

  def edit
    @item_post = ItemPost.find(params[:item_post_id])
    @review = Review.find(params[:id])
  end
  
  def update
    @item_post = ItemPost.find(params[:item_post_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to item_post_review_path(@item_post.id, @review.id)
      flash[:notice] = "レビューの更新に成功しました"
    else
      flash[:alert] = "レビューの更新に失敗しました。"
      @item_post = ItemPost.find(params[:item_post_id])
      @review = Review.find(params[:id])
      render :edit
    end
  end
  
  def destroy
    item_post = ItemPost.find(params[:item_post_id])
    review = Review.find(params[:id])
    review.destroy
    redirect_to item_post_path(item_post)
  end
  
  private
  def correct_customer
    @item_post = ItemPost.find(params[:item_post_id])
    @review = Review.find(params[:id])
    #投稿したユーザーとログインしているユーザーが合致していなければホームへ
    unless @review.customer.id == current_customer.id
      redirect_to root_path
    end
  end

  def review_params
   params.require(:review).permit(:customer_id, :item_post_id, :title, :impression, :item_price, :star)
  end
end