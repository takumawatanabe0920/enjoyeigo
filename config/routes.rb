Rails.application.routes.draw do

  devise_for :admins
  devise_for :teachers
  devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :teachers do
    root "teachers#index"

    resources :teachers, only: [:index, :show]
  end


  root "toppages#index"
  resources :students, only: [:show]

  namespace :admins do
    root "top#index"
    resources :students
    resources :teachers
  end# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :teachers, only: [:index]
  resources :searches
end
