Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated do
      resources :users

      root to: "users/dashboard#index", as: :user_root
    end

    unauthenticated do
      root to: "devise/sessions#new"
    end
  end
end
