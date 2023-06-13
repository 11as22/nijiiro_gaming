class Public::ItemPostsController < ApplicationController
  # ログインしていないユーザーの許されるアクション
  before_action :authenticate_customer!, except: [:index]
  # 他のカスマターが自分に対して行えないアクション
  before_action :correct_customer, only: [:edit, :update, :destroy]
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
    # ------全てのif文に@item_posts_countで商品表示件数を表示することで、ソート順にした時に内部データが出ないようにする----------
    # ヘッダーからリンクを踏んだ時に最初に、モデルからアイテム件数を取得
    @item_post_count = ItemPost.includes(:item_name).count
    #もしurlにcustomer_idを含んでいたら、その人のitem_postsを取得するコントローラー
    if params[:customer_id].present?
      @item_posts = ItemPost.where(customer_id: params[:customer_id])
      @item_post_count = @item_posts.count
    else
      if params[:review_count]
        @item_posts = ItemPost.review_count
        @item_post_count = @item_posts.count
      elsif params[:review_rate]
        @item_posts = ItemPost.review_rate
        @item_post_count = ItemPost.includes(:item_name).count
      else
        @item_posts = ItemPost.all

      end
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

  def correct_customer
    @item_post = ItemPost.find(params[:id])
    #投稿したユーザーとログインしているユーザーが合致していなければホームへ
    unless @item_post.customer.id == current_customer.id
      redirect_to root_path
    end
  end

  def item_post_params
    params.require(:item_post).permit(:item_genre_id, :item_name, :item_explanation, :model_number, :item_image, :customer_id, :item_favorites)
  end
end
