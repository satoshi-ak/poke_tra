Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :articles
  root to: 'tops#index'
  get "users/show" => "users#show"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :favorites, only: [:create, :destroy, :index]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
