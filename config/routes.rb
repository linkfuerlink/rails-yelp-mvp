Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # GET 'restaurants', to: 'restaurants#index'
  # GET 'restaurants/new', to: 'restaurants#create'
  # POST 'restaurants', to: 'restaurants#update'
  # GET 'restaurants/:id', to: 'restaurants#show'

  # GET 'restaurants/:id/reviews/new', to: 'reviews#create'
  # POST 'restaurants/:id/reviews', to: 'reviews#create'

  resources :restaurants do
    resources :reviews, only: [:new, :create]
  end
end
