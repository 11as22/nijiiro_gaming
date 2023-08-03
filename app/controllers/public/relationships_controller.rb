class Public::RelationshipsController < ApplicationController
  # ログインしていないユーザーの許されるアクション
  before_action :authenticate_customer!
  # フォローするとき
  def create
    @customer = Customer.find(params[:customer_id])
    current_customer.follow(params[:customer_id])
  end
  # フォロー外すとき
  def destroy
    @customer = Customer.find(params[:customer_id])
    current_customer.unfollow(params[:customer_id])
  end
  # フォロー一覧
  def followings
    @customer = Customer.find(params[:customer_id])
    customers = @customer.followings
    @customers = Kaminari.paginate_array(customers).page(params[:page])
    @customers_relay = customers
  end
  # フォロワー一覧
  def followers
    @customer = Customer.find(params[:customer_id])
    customers = @customer.followers
    @customers = Kaminari.paginate_array(customers).page(params[:page])
    @customers_relay = customers
  end
end
