Rails.application.routes.draw do
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'review_comments/index'
  end
  namespace :admin do
    get 'reviews/index'
    get 'reviews/show'
    get 'reviews/edit'
  end
  namespace :admin do
    get 'item_genres/index'
    get 'item_genres/edit'
  end
  namespace :admin do
    get 'item_posts/index'
    get 'item_posts/show'
    get 'item_posts/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'item_favorites/index'
  end
  namespace :public do
    get 'review_comments/new'
    get 'review_comments/index'
  end
  namespace :public do
    get 'reviews/new'
    get 'reviews/index'
    get 'reviews/show'
    get 'reviews/edit'
  end
  namespace :public do
    get 'item_posts/new'
    get 'item_posts/index'
    get 'item_posts/show'
    get 'item_posts/edit'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
