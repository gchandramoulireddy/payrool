Payrolles::Application.routes.draw do
  resources :time_sheets


  get "password_resets/new"

  resources :payrolls do
    collection do
      get 'generate_payroll'
    end
  end
  resources :salaries
  devise_for :users,  :controllers => { :registrations => "users/Registrations" }
  root :to => "employes#index"
  resources :holidays
  resources :leaves do
    member do
      put 'approve_leave'
    end
    collection do
      get 'leave_history'
      get 'leave_to_approve'
    end
  end
  resources :employes
  resources :users do
    resources :salaries
    resources :payrolls
  end
  resources :password_resets
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "employes#index"
  

end
