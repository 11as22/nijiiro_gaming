class Public::ItemPostsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]
  def new
    @item_post = ItemPost.new
  end

  def create
    @item_post = ItemPost.new(item_post_params)
    @item_post.customer_id = current_customer.id
    if @item_post.save
      #追加したアイテムの詳細ページ
      redirect_to item_post_path (@item_post)
      #追加したアイテム名を表示
      flash[:notice] = "#{@item_post.item_name}を追加しました"
    else
      flash[:alert] = "追加に失敗しました"
      @item_post = ItemPost.new(item_post_params)
      render :new
    end
  end

  def index
    #もしulrにcustomer_idを含んでいたら、その人のitem_postsを取得するコントローラー
    if params[:customer_id].present?
      @item_posts = ItemPost.where(customer_id: params[:customer_id])
    else
      @item_posts = ItemPost.all
    end
    @genres = ItemGenre.all
  end

  def show
    @item_post = ItemPost.find(params[:id])
    @reviews = @item_post.reviews.all
  end

  def edit
    @item_post = ItemPost.find(params[:id])
  end

  def update
     @item_post = ItemPost.find(params[:id])
    if @item_post.update(item_post_params)
      redirect_to item_post_path
      flash[:notice] = "商品情報の更新に成功しました"
    else
      render :edit
      flash[:alert] = "商品情報の更新に失敗しました。"
    end
  end

  def destroy
    item_post = ItemPost.find(params[:id])
    item_post.destroy
    redirect_to item_posts_path
  end

  private

  def item_post_params
    params.require(:item_post).permit(:item_genre_id, :item_name, :item_explanation, :model_number, :item_image, :customer_id)
  end
end
