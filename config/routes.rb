# frozen_string_literal: true

Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'main#index'
  get 'main/index'
  match '/about', to: 'main#about', via: :get
  match '/hello', to: 'main#hello', via: :get

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

  # get 'categories/index'
  # get 'categories/show'
  # get 'categories/new'
  # get 'categories/edit'
  # get 'categories/delete'
  #
  # get 'tasks/index'
  # get 'tasks/new'
  # post 'tasks/create'
  # get 'tasks/edit'
  # get 'tasks/show'
  # get 'tasks/delete'
end
