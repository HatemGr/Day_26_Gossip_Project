Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ------ HOME(GOSSIP INDEX) - GOSSIP SHOW
  root to: 'gossips#index'
  get '/gossips/:id', to: 'gossips#show', as: 'gossip'


  # ------ TEAM - CONTACT - URL_CACHEE
  
  get '/team', to: 'pages#team', as: 'team'
  get 'contact/', to: 'pages#contact', as: 'contact'
  get '/welcome/:first_name', to: 'pages#welcome'

  # ------ USER SHOW

  get '/users/:id', to: 'users#show', as: 'user'
  
end
