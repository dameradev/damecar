Rails.application.routes.draw do
  resources :portfolios, except: [:show, ]
  resources :blogs

  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio-show'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
