Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'posts/posts'
  get 'home/home'
  root 'home#home'
  root to: "home#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end
  # Defines the root path route ("/")
  # root "articles#index"

