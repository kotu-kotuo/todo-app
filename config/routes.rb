Rails.application.routes.draw do
  devise_for :users
  root  'boards#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :boards do
    resources :tasks, only: [:show, :new, :create , :edit , :update , :destroy]
  end

  resources :tasks, only: [:show] do
    resources :comments
  end


end
