Rails.application.routes.draw do
  devise_for :users
  root "bboards#index"

  resources :bboards do
    resources :songs
  end

  resources :artists do
    resources :songs
  end

end
