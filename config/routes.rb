Rails.application.routes.draw do


devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
# ゲストサインイン実装
devise_scope :customer do
  post '/customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
end
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # 管理者側のルーティング設定
  namespace :admin do
    resources :item_posts, only:[:index, :show ,:edit, :update, :destroy] do
      resources :reviews, only:[:show, :edit, :update, :destroy]
    end

     get 'customer/:customer_id/reviews' => 'customers#reviews'
    resources :customers, only:[:index, :show, :edit, :update] do
      member do
        get :favorites
      end
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :item_genres, only:[:index, :edit, :create, :update]

    # resources :review_comments, only:[:index, :destroy]
    root to: 'homes#top'
    get '/about' =>'homes#about'
    get '/genre/:id' =>'homes#index', as: 'index'
    get "/search" => "searches#search"
  end

  scope module: :public do
    resources :item_posts, only:[:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :item_favorites, only: [:create, :destroy]
      resources :reviews, only:[:new, :create, :show, :edit, :update, :destroy]
    end

    get '/customer/:customer_id/reviews' => 'customers#reviews'
    get 'customers' => redirect("/customers/sign_up")
    resources :customers, only:[:show, :edit, :update] do
      member do
        get :favorites
      end
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

    # resources :review_comments, only:[:new, :create, :index, :destroy]
    root to: 'homes#top'
    get '/about' =>'homes#about'
    get '/genre/:id' =>'homes#index', as: 'index'
    get '/search' => 'searches#search'
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
