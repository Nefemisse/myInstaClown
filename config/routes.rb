Rails.application.routes.draw do
  devise_scope :user do
    get "/users", to: "devise/registrations#new"
    get "/users/password", to: "devise/password#new"
    get "/users/sign_out", to: "devise/sessions#destroy"
  end

  devise_for :users

  get "home/about"
  get "posts/myPosts"

  resources :posts

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "posts#index"
end
