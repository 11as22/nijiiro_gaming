class Admin::ItemGenresController < Admin::ApplicationController
  def index
    @genre = ItemGenre.new
    @genres = ItemGenre.all
  end
  
  def create
    @genre = ItemGenre.new(item_genre_params)
      if @genre.save
        # create機能を発火させた元の画面にもどす
        flash[:notice] = "ジャンルの作成に成功しました"
        redirect_to request.referer
      else
        #作成失敗した場合、ジャンル一覧画面へ遷移
        @genres = ItemGenre.all
        flash[:create_alert] = "ジャンルの作成に失敗しました"
        render :index
      end
  end

  def edit
    @genres = ItemGenre.find(params[:id])
  end

  def update
    @genres = ItemGenre.find(params[:id])
    if @genres.update(item_genre_params)
      redirect_to admin_item_genres_path
    else
      flash[:edit_alert] = "編集に失敗しました"
      render :edit
    end
  end
  
  def destroy
    item_genre = ItemGenre.find(params[:id])
    item_genre.destroy
    redirect_to admin_item_genres_path
  end
  

private

  def item_genre_params
    params.require(:item_genre).permit(:genre)
  end

end
