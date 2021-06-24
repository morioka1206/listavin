# == Route Map
#

Rails.application.routes.draw do
  get 'wines/contact'
  get 'wines/winelist'

  root to: "wines#top"


  resources :shops
  resources :sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'wines/top'
  get 'wines/howto'

  resources :wines do
    member do
      get 'copy'
    end
    collection do
      get 'search'
      get 'winelist_search'
    end
  end

  # resources :howtos

  get 'howtos', to: "howtos#index"
  get 'howtos/detail'
  get 'howtos/copy'
  get 'howtos/shop_registration'
  get 'howtos/wine_registration'
  get 'howtos/search'
  get 'howtos/edit'
  get 'howtos/winelist'

end
