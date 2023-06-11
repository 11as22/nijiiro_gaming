class Public::CustomersController < ApplicationController
   # ログインしていないユーザーの許されるアクション
  before_action :authenticate_customer!, except: [:reviews, :show]
   # 他のカスタマーが自分に対して行えないアクション
  before_action :correct_customer, only: [:edit, :update, :destroy]
  def index
    @customer = Customer.find(params[:id]) 
    @item_posts = @customer.item_posts.all
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
      redirect_to customer_path(@customer)
      flash[:notice] = "会員情報の更新に成功しました"
    else
      @customer = Customer.find(params[:id])
      flash[:alert] = "会員情報の更新に失敗しました。"
      render :edit
    end
  end

  def reviews
    @customer = Customer.find(params[:customer_id])
    @reviews = @customer.reviews
  end

  private
    
    def customer_params
      params.require(:customer).permit(:email, :display_name, :introduction, :profile_image)
    end
   
  def correct_customer
    @customer = Customer.find(params[:id])
    unless @customer.id == current_customer.id
      redirect_to root_path
    end
  end
    
end