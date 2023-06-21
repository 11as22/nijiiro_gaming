class Admin::CustomersController < Admin::ApplicationController
  def index
    @customers = Customer.page(params[:page])
    @customers_count = Customer.all.count
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path
      flash[:notice] = "会員情報の更新に成功しました"
    else
      flash[:alert] = "会員情報の更新に失敗しました。"
      render :edit
    end
  end

  def reviews
    @customer = Customer.find(params[:customer_id])
    reviews = @customer.reviews
    @reviews = Kaminari.paginate_array(reviews).page(params[:page])
  end

  def favorites
    @customer = Customer.find(params[:id])
    # ユーザーidが、このユーザーのいいねのレコードを全て取得。item_post_idも一緒に持ってくる。引数にその情報を入れると、favoritesの中身には、あるユーザーがいいねした商品投稿のid。
    favorites = ItemFavorite.where(customer_id: @customer.id).pluck(:item_post_id)
    favorite_posts = ItemPost.find(favorites)
    @favorite_posts =  Kaminari.paginate_array(favorite_posts).page(params[:page])
    @favorite_posts_count = favorite_posts.count
  end

  private

  def customer_params
      params.require(:customer).permit(:email, :display_name, :introduction, :profile_image, :item_favorites, :member_status)
  end
end