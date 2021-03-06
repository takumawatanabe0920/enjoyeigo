Rails.application.routes.draw do

  devise_for :admins
  devise_for :teachers
  devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :teachers do
    root "teachers#index"

    resources :teachers, only: [:index, :show, :edit, :update] do
      resources :messages, only: [:create]
      resources :prefectures, only: [:index]
      member do
       get :requesters
       get :permits
      end
    end
    resources :profiles, only: [:edit, :update] do
      collection do
        get 'search'
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

   resources :messages, only: [:create]

   get "inquirys" => 'inquirys#index'
   get 'inquirys/confirm' => redirect("/inquirys")
   get 'inquirys/thanks' => redirect("/inquirys")
   post "inquirys/confirm" => "inquirys#confirm"
   post "inquirys/thanks" => "inquirys#thanks"
end
