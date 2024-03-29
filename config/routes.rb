Rails.application.routes.draw do
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  devise_for :employees, controllers: {
    sessions: "employees/sessions",
    registrations: "employees/registrations"
  }

  authenticated :user do
    resources :users
    resources :employees, controller: "users/employees" do
      put :update_status
    end

    get '/profile', to: 'users/profile#show'
    get "/hired_employees", to: "users/dashboard#hired_employees"
    get "/hiring_form", to: "users/hiring#hiring_form"
    root to: "users/dashboard#index", as: :authenticated_user_root
  end

  authenticated :employee do
    resources :employees

    root to: "employees/dashboard#index", as: :authenticated_employee_root
  end

  devise_scope :employee do
    root to: "employees/registrations#new"
  end

end
