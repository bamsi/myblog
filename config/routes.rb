Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end

  get 'posts/new', to: 'posts#new', as: 'new_post'
  post 'posts/new', to: 'posts#create'

  get ':id/comments/new', to: 'comments#new', as: 'new_comment'
  post ':id/comments/new', to: 'comments#create'

  post ':id/likes/new', to: 'likes#create', as: 'like_post'
end
