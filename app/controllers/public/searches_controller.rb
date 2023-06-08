class Public::SearchesController < ApplicationController
  def search
    @range = params[:range]

    if @range == "商品モデル番号"
      @model_numbers = ItemPost.model_number.looks(params[:search], params[:word])
    else
      @item_names = ItemPost.item_name.looks(params[:search], params[:word])
    end
  end
end
