Rails.application.routes.draw do

  resources :books, only: [:index, :show, :create, :edit, :update, :destroy ]

  devise_for :users

  get 'home/about' => 'homes#about', as: 'about'
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
