class Admin::ReviewsController < Admin::ApplicationController

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
      flash[:notice] = "レビューの更新に成功しました"
      redirect_to admin_item_post_review_path(@item_post.id, @review.id)
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
    redirect_to admin_item_post_path(item_post)
  end

  private

  def review_params
   params.require(:review).permit(:customer_id, :item_post_id, :title, :impression, :item_price, :star)
  end
end