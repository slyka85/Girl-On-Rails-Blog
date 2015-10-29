Rails.application.routes.draw do

  devise_for :users
  get 'contact' => 'pages#contact'
  get 'index' => 'posts#index'
  resources :posts

  root 'posts#index'

end
