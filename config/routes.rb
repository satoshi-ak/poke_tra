Rails.application.routes.draw do
  resources :articles
  root to: 'tops#index'
  get "users/show" => "users#show"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
