Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get "angular-items", to: "portfolios#angular"

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
<<<<<<< HEAD
<<<<<<< HEAD

  mount ActionCable.server => '/cable'
=======
  get 'tech-news', to: "pages#tech_news"
>>>>>>> lib
=======

  get 'tech-news', to: "pages#tech_news"


  mount ActionCable.server => '/cable'

>>>>>>> 1b9ca647389102acee1c0aa8af06840282ad1062
  root to: 'pages#home'


end
