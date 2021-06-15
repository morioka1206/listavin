Rails.application.routes.draw do
  get 'wines/index'
  get 'wines/contact'
  get 'wines/winelist'

  resources :shops
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'wines/top'

  resources :wines do
    member do
      get 'copy'
    end
    collection do
      get 'search'
      get 'winelist_search'
    end
  end
  
end