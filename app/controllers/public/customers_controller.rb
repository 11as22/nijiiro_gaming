class Public::CustomersController < ApplicationController
  def show
  end

  def edit
  end
  
  def update
  end

  private
    
    def customer_params
      params.require(:customer).permit(:email, :display_name, :introduction, :profile_image)
    end
end