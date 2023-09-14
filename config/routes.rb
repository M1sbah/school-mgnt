Rails.application.routes.draw do
  # root 'home#index'
  root 'admin/dashboard#index'
  get '/about' => 'home#about'

  resources :teachers do
    collection do
      get :search
    end
  end
  resources :students, :subjects
  namespace :admin do
    get 'dashboard' => 'dashboard#index'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
