class Admin::RelationshipsController < Admin::ApplicationController
  #フォロー一覧
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
