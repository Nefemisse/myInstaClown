Rails.application.routes.draw do
  resources :likes, only: [ :create, :destroy ]
  resources :comments

  devise_scope :user do
    get "/users", to: "devise/registrations#new"
    get "/users/password", to: "devise/password#new"
    get "/users/sign_out", to: "devise/sessions#destroy"
  end

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  resources :users, only: [ :show ]

  post "users/:id/follow", to: "users#follow", as: "follow"
  post "users/:id/unfollow", to: "users#unfollow", as: "unfollow"
  post "users/:id/accept", to: "users#accept", as: "accept"
  post "users/:id/decline", to: "users#decline", as: "decline"
  post "users/:id/cancel", to: "users#cancel", as: "cancel"

  get "home/about"
  get "posts/myPosts"

  resources :posts

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "posts#index"
end
