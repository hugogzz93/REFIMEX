Rails.application.routes.draw do
  root 'welcome#index'

  get '/modifiers/find', to: 'modifiers#find', as: 'find_modifier'
  get '/orders/:product_id/new', to: 'orders#new', as: 'new_order'

  delete '/sign_out', to: 'sessions#log_out', as: 'sign_out'

  resources :products, :modifiers
  resources :orders, only: [:create, :index, :destroy, :show]
  resources :users, only: [:index, :edit, :update, :destroy]
  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
