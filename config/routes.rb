Rails.application.routes.draw do
  root 'companies#index'

  resources :companies do
    resources :contacts, only: [:create]
    resources :jobs, module: :companies do
      resources :comments, only: [:create, :new, :destroy]
    end
    
    resources :categories, only: [:new, :create], module: :companies
  end
<<<<<<< HEAD

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
=======
  resources :jobs, only: [:index]
>>>>>>> 32c16dfc0835ee162ad3abcdd9c8a843290ac1bd

  resources :categories

  resources :dashboard, only:[:index]
 
end
