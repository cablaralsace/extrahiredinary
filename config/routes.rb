Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root to: "home#index"
  devise_scope :user do
    authenticated do
      resources :users

      root to: "users/dashboard#index", as: :user_root
    end

    unauthenticated do
      root to: "devise/sessions#new"
    end
  end
  # namespace :user do
  #   root :to => "users#index"
  # end

end
