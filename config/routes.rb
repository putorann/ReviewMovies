Rails.application.routes.draw do

  devise_for :users, controllres: { sessions: 'users/sessions' }
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  get "search" => "searches#search"
  # , controllers: {
  #   registrations: 'users/registrations'
  # }

  get root to: 'homes#top'

  get '/home/about' => 'homes#about',as: 'about'

 # post '/homes/guest_sign_in', to: 'homes#guest_sign_in'


  resources :movies, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
  end


  resources :users, only: [:index, :show, :edit, :update, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end