Rails.application.routes.draw do
  root :to => 'movies#index'

  resources :movies do
    post 'sorted'
    resources :reviews
  end
end
