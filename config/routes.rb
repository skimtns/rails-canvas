Rails.application.routes.draw do
  root 'courses#index'

  #this generates 2 routes that dont depend on the id
  resources :users
  resources :courses do
    resources :enrollments, only: [:index, :new, :create, :destroy]
  end 
end
