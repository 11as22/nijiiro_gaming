Rails.application.routes.draw do

devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # 管理者側のルーティング設定
  namespace :admin do
    resources :item_posts, only:[:index, :show ,:edit, :update, :destroy]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :item_genres, only:[:index, :edit, :create, :update]
    resources :reviews, only:[:index, :show, :edit, :update, :destroy]
    resources :review_comments, only:[:index, :destroy]
    root to: 'homes#top'
  end

  scope module: :public do
    resources :item_posts, only:[:new, :create, :index, :show, :edit, :update, :destroy]

    get 'customers/mypage' => 'customers#show'
    resources :customers, only:[:edit, :update]

    resources :reviews, only:[:new, :create, :index, :show, :edit, :update, :destroy]
    resources :review_comments, only:[:new, :create, :index, :destroy]

    root to: 'homes#top'
    get '/about' =>'homes#about'
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
