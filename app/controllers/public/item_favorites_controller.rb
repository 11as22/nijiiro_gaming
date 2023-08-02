class Public::ItemFavoritesController < ApplicationController
  before_action :authenticate_customer!

  def create
    @item_post = ItemPost.find(params[:item_post_id])
    @item_favorite = ItemFavorite.new(customer_id: current_customer.id, item_post_id: params[:item_post_id])
    @item_favorite.save
  end
  
  def destroy
    @item_post = ItemPost.find(params[:item_post_id])
    @item_post_favorite = ItemFavorite.find_by(customer_id: current_customer.id, item_post_id: params[:item_post_id])
    @item_post_favorite.destroy
  end
end
