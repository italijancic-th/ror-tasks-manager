Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'main#index'
  get 'main/index'
  get '/about', to: 'main#about'
  get '/hello', to: 'main#hello'

  get '/login', to: 'access#new'
  delete '/logout', to: 'access#destroy'

  resource :access, controller: 'access', only: [:new, :create, :destroy] do
    member do
      get :menu
    end
  end

  resources :categories do
    member do
      get :delete
    end
  end

  resources :tasks do
    member do
      get :delete
    end
  end

end
