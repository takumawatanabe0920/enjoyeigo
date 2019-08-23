Rails.application.routes.draw do

  namespace :teachers do
    get 'profiles/new'
    get 'profiles/create'
  end
  devise_for :admins
  devise_for :teachers
  devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :teachers do
    root "teachers#index"
    resources :profiles, only: [:edit, :update]
    resources :teachers, only: [:index, :show, :edit, :update] do
      member do
       get :requesters
       get :permits
      end
    end

    resources :permits, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]

  root "toppages#index"

  resources :students, only: [:show] do
    member do
      get :requestings
      get :permiters
    end
  end

  resources :requests, only: [:create, :destroy]

  namespace :admins do
    root "top#index"
    resources :students
    resources :teachers
    resources :notifications, only: [:create, :destroy]
  end# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :searches, only: [:index]


  #resources :teachers, only: [:index]
end
