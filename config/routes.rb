Rails.application.routes.draw do

  # ------ HOME(GOSSIP INDEX) - GOSSIP SHOW
  resources :gossips
  root to: 'gossips#index'


  resources :gossips  do
    resources :comments
  end


  # ------ USER SHOW
  resources :users, only: [:index, :show]

  # ------ USER SHOW
  resources :cities, only: [:index, :show]

  # ------ STATIC PAGES : TEAM - CONTACT - URL_CACHEE
  get '/team', to: 'pages#team', as: 'team'
  get 'contact/', to: 'pages#contact', as: 'contact'
  get '/welcome/:first_name', to: 'pages#welcome'
  
end



# get 'gossips/new', to: 'gossips#new', as: 'new_gossip'
# post 'gossips/new', to: 'gossips#create'
# get '/gossips/:id', to: 'gossips#show', as: 'gossip'
# get '/users/:id', to: 'users#show', as: 'user'
