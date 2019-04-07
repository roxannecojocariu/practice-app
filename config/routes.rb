Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'

  resources :articles do
    resources :comments
  end

  namespace :api do
    namespace :v1 do
      resources :articles, only: [:index]
    end
  end
end
