Rails.application.routes.draw do
  get 'comments/create'
  get 'pages/home'
  resources :questions do
    # post 'comments', to: 'comments#create'
    resources :comments, only: [:create, :destroy]
  end

  resources :comments do
    resources :comments
  end

  devise_for :users

  devise_scope :user do
    root 'devise/sessions#new'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
