Rails.application.routes.draw do

  root to: 'stores#index'

  resources :stores, only: :index do
    collection do
      post 'data'
    end
  end
end
