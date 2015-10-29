Rails.application.routes.draw do

  get 'contact' => 'pages#contact'
  get 'index' => 'posts#index'
  resources :posts

  root 'posts#index'

end
