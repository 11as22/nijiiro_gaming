class Public::SearchesController < ApplicationController
  def search
    # viewのform_tagにて
    # 選択したmodelの値を@modelに代入。
    @column = params["column"]
    # 選択した検索方法の値を@methodに代入。
    @method = params["method"]
    # 検索ワードを@contentに代入。
    @content = params["content"]
    # @model, @content, @methodを代入した、
    # search_forを@recordsに代入。
    records = search_for(@column, @content, @method)
    @records = Kaminari.paginate_array(records).page(params[:page])
    @records_count = records.count
    render "public/searches/search_result"
  end

  private
  
  def search_for(column, content, method)
    # 商品モデルナンバーを選択したら
    if column == 'model_number'
      # 選択した検索方法がが完全一致だったら
      if method == 'perfect'
        ItemPost.where(model_number: content)
      # 選択した検索方法がが部分一致だったら
      else
        ItemPost.where('model_number LIKE ?', '%'+content+'%')
      end
    # 選択がアイテムモデルだったら
    elsif column == 'item_name'
      if method == 'perfect'
        ItemPost.where(item_name: content)
      else
        ItemPost.where('item_name LIKE ?', '%'+content+'%')
      end
    end
  end
end

