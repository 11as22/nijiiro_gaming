class Admin::SearchesController < Admin::ApplicationController
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
    @records = search_for(@column, @content, @method)
    render "admin/searches/search_result"
  end

  private

  def search_for(column, content, method)
    # 商品モデルナンバーを選択したら
    if column == 'model_number'
      # 選択した検索方法がが完全一致だったら
      if method == 'perfect'
        ItemPost.where(model_number: content)
    #選択した検索方法がが部分一致だったら
      else
        ItemPost.where('model_number LIKE ?', '%'+content+'%')
      end
    #選択が商品名だったら
    elsif column == 'item_name'
      if method == 'perfect'
        ItemPost.where(item_name: content)
      else
        ItemPost.where('item_name LIKE ?', '%'+content+'%')
      end
    #選択が表示名だったら（会員）
    elsif column == 'display_name'
      if method == 'perfect'
        Customer.where(display_name: content)
      else
        Customer.where('display_name LIKE ?', '%'+content+'%')
      end
       #選択がメールアドレスだったら(会員)
    elsif column == 'email'
      if method == 'perfect'
        Customer.where(email: content)
      else
        Customer.where('email LIKE ?', '%'+content+'%')
      end
    end
  end
end