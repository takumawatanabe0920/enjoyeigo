Rails.application.routes.draw do
  devise_for :admins
  devise_for :teachers
  devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :teachers do
    root "teachers#index"

    resources :teachers, only: [:index, :show]

    resources :profiles, only: [:show, :new, :create]
  end


  root "toppages#index"
  resources :students, only: [:show]

  namespace :admins do
    root "top#index"
    resources :students
    resources :teachers
    resources :notifications, only: [:create, :destroy]
  end# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :searches, only: [:index]

  #resources :teachers, only: [:index]
end
