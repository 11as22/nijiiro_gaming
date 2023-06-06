class Public::ItemPostsController < ApplicationController
  def new
  end
  
  def create
  end

  def index
  end

  def show
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def item_post_params
    params.require(:item_post).permit(:customer_id, :item_genre_id, :item_name, :item_explanation, :model_number, :item_image)
  end
end
