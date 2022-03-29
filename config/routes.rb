Rails.application.routes.draw do
  devise_for :users
  resources :customers, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:new, :create, :show, :edit, :update, :destroy]
  end

  resources :shifts, only: [:index, :show, :create, :edit, :update, :destroy]
  resources :users, only: [:show, :all_show, :edit, :update]
end
