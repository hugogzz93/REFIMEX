Rails.application.routes.draw do
  root 'welcome#index'
  get '/modifiers/find', to: 'modifiers#find', as: 'find_modifier'
  resources :products, :modifiers
  resources :users, only: [:index, :edit, :update, :destroy]
  devise_for :users, controllers: { registrations: 'registrations' } do
  

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
