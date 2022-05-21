Rails.application.routes.draw do

  
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy ]
  

  devise_for :users
  
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' =>'relationships#followings', as: 'followings'
    get 'followers' =>'relationships#followers', as: 'followers'
  end

  get 'home/about' => 'homes#about', as: 'about'
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
