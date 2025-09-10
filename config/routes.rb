Rails.application.routes.draw do
  get 'searches/search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root :to => "homes#top"
  get "home/about" => "homes#about"
  get "search" => "searches#search"
  get "tag_searches/search" => "tag_searches#search"


  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  scope module: :public do
  resources :groups, except: [:destroy] do
  # resources :groups, only: [:new, :index, :show, :create, :edit, :update] 
    resource :group_users, only: [:create, :destroy]
    resource :permits, only: [:create, :destroy]
    resources :event_notices, only: [:new, :create]
    get "event_notices" => "event_notices#sent"
  end
  get "groups/:id/permits" => "groups#permits", as: :permits

  end




  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
