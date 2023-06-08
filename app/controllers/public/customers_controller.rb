class Public::CustomersController < ApplicationController
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
end