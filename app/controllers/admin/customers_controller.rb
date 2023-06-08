class Admin::CustomersController < Admin::ApplicationController
  def index
    @customers = Customer.all
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
  
  private

  def customer_params
      params.require(:customer).permit(:display_name, :email, :introduction, :profile_image, :member_status)
  end
end