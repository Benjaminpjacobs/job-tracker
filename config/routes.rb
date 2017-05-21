Rails.application.routes.draw do
  root 'companies#index'

  resources :companies do
    resources :contacts, only: [:create]
    resources :jobs, module: :companies do
      resources :comments, only: [:create, :new, :destroy]
    end
    
    resources :categories, only: [:new, :create], module: :companies
  end
  resources :jobs, only: [:index]

  resources :categories
 
end
